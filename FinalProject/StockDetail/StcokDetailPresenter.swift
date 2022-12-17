//
//  StcokDetailPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 12/12/22.
//

import Foundation
import UIKit


protocol StockDetailPresenterProtocol: AnyObject {
    
    func onViewDidLoad()
    func didGetQuotesDetail(quotesDetailResponse: GlobalQuotes)
    func didGetCompanyOverview(companyResponse: CompanyOverviewResponse)
    func didGetLineChartData(data : [String : TimeSeriesDaily])
    func didSelectBuyStock(_ stockSelected: BestMatches,_ stockPrice: Double,_ dailyStockPrice: [DailyClosePrice])
    func didSelectSellStock(_ stockSelected: BestMatches,_ stockPrice: Double,_ dailyStockPrice: [DailyClosePrice])
    func didGetPortfolio(myPortfolio: [PortfolioData])

}

class StockDetailPresenter: StockDetailPresenterProtocol {

    weak var view: StockDetailViewProtocol?
    var interactor: StockDetailInteractorProtocol?
    var router: StockDetailRouterProtocol?
    
    var stockSelected: BestMatches
    var quotesDetail: [QuotesInformation] = []
    var companyOverviewDetail: [CompanyOverviewInformation] = []
    var transactionIdentifier: Bool = false
    var myPortfolio: [PortfolioData] = []
    
    init(stockSelected: BestMatches) {
        self.stockSelected = stockSelected
    }
    
    func onViewDidLoad() {
        view?.setStockInformation(stockSelected: stockSelected)
        interactor?.getQuotesDetail(stockSelected.symbol)
        interactor?.getCompanyOverviewDetail(stockSelected.symbol)
        interactor?.getLineChartDataDetail(stockSelected.symbol)
        interactor?.getPortfolio()
    }
    
    func didGetQuotesDetail(quotesDetailResponse: GlobalQuotes) {
        let quotesDetail = [
            QuotesInformation(title1: "Price", value1: String(Double(quotesDetailResponse.price) ?? 0), title2: "Open", value2: String(Double(quotesDetailResponse.open) ?? 0)),
            QuotesInformation(title1: "High", value1: String(Double(quotesDetailResponse.high) ?? 0), title2: "Low", value2: String(Double(quotesDetailResponse.low) ?? 0)),
            QuotesInformation(title1: "Volume", value1: String(Int(quotesDetailResponse.volume) ?? 0) , title2: "Change Perc.", value2: quotesDetailResponse.changePercent),
            QuotesInformation(title1: "Change", value1: String(Double(quotesDetailResponse.change) ?? 0), title2: "Prev. close ", value2: String(Double(quotesDetailResponse.previousClose) ?? 0)),
        ]
        view?.setStockPrice(stockPrice: Double(quotesDetailResponse.price) ?? 0)
        view?.setQuotesInformation(quotesDetail: quotesDetail)
    }
    
    
    func didGetCompanyOverview(companyResponse: CompanyOverviewResponse){
        let ebitdaM = (Double(companyResponse.ebitda) ?? 0)/1000000
        let marketCapM = (Double(companyResponse.marketCapitalization) ?? 0)/1000000
        let companyOverviewDetail = [
            CompanyOverviewInformation(title1: "Sector", value1: companyResponse.sector.capitalized, title2: "Industry", value2: companyResponse.industry.capitalized, title3: "Asset type", value3: companyResponse.assetType, title4: "Exchange", value4: companyResponse.exchange),
            CompanyOverviewInformation(title1: "Beta", value1: companyResponse.beta, title2: "EBITDA", value2: "\(Int(ebitdaM))M", title3: "PE Ratio", value3: companyResponse.peRatio, title4: "EPS", value4: companyResponse.eps),
            CompanyOverviewInformation(title1: "Book Value P/Share ", value1: companyResponse.bookValue, title2: "Market Cap.", value2: "\(Int(marketCapM))M", title3: "52 Week high", value3: companyResponse.fiftytwoWeekHigh, title4: "52 Week low", value4: companyResponse.fiftytwoWeekLow)
        ]
        
        view?.setCompanyOverviewInformation(companyOverviewDetail: companyOverviewDetail)
    }
    
    func didGetLineChartData(data : [String : TimeSeriesDaily]) {
        var dailyInfo: [DailyClosePrice] = []
        let sorting = data.sorted(by: {$0.key < $1.key})
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var closePrice : [Double] = []
        var datesString : [String] = []
        
        sorting.forEach({
            (dateString, timeSeriesDaily) in
            let date = dateFormatter.date(from: dateString)!
            let daily = DailyClosePrice(date: date, close: Double(timeSeriesDaily.close) ?? 0)
            dailyInfo.append(daily)
            let dateShortFormat  = DateFormatter()
            dateShortFormat.dateStyle = .short
            
            closePrice.append(Double(timeSeriesDaily.close) ?? 0)
            datesString.append(dateShortFormat.string(from: date))
            
        })
        view?.setDailyClosePrice(dailyClosePrice: dailyInfo)
        view?.makingLineChart(datesString, closePrice)
    }
    
    func didGetPortfolio(myPortfolio: [PortfolioData]) {
        self.myPortfolio = myPortfolio
        myPortfolio.forEach { element in
            if element.symbol == stockSelected.symbol {
                view?.showSellButton()
            }
        }
    }
    
    
    func didSelectBuyStock(_ stockSelected: BestMatches,_ stockPrice: Double,_ dailyStockPrice: [DailyClosePrice] ) {
        transactionIdentifier = true
        router?.goToTransactionStockViewController(stockSelected,stockPrice,dailyStockPrice,transactionIdentifier)
    }
    
    func didSelectSellStock(_ stockSelected: BestMatches,_ stockPrice: Double,_ dailyStockPrice: [DailyClosePrice]) {
        transactionIdentifier = false
        router?.goToTransactionStockViewController(stockSelected,stockPrice,dailyStockPrice,transactionIdentifier)
    }
}
    


