//
//  StcokDetailPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 12/12/22.
//

import Foundation


protocol StockDetailPresenterProtocol: AnyObject {
    
    
    func onViewDidLoad()
    func didGetQuotesDetail(quotesDetailResponse: GlobalQuotes)
    func didGetCompanyOverview(companyResponse: CompanyOverviewResponse)
    func didGetLineChartData(data : [String : TimeSeriesDaily])
    func didSelectBuyStock(_ stockSelected: BestMatches)

}

class StockDetailPresenter: StockDetailPresenterProtocol {

    
    weak var view: StockDetailViewProtocol?
    var interactor: StockDetailInteractorProtocol?
    var router: StockDetailRouterProtocol?
    
    var stockSelected: BestMatches
    var quotesDetail: [QuotesInformation] = []
    var companyOverviewDetail: [CompanyOverviewInformation] = []
    
    init(stockSelected: BestMatches) {
        self.stockSelected = stockSelected

    }
    
    func onViewDidLoad() {
        view?.setStockInformation(stockSelected: stockSelected)
        interactor?.getQuotesDetail(stockSelected.symbol)
        interactor?.getCompanyOverviewDetail(stockSelected.symbol)
        interactor?.getLineChartDataDetail(stockSelected.symbol)
        print(stockSelected.symbol)
    }
    
    
    func didGetQuotesDetail(quotesDetailResponse: GlobalQuotes) {
       
        let quotesDetail = [
            QuotesInformation(title1: "Price", value1: String(Double(quotesDetailResponse.price) ?? 0), title2: "Open", value2: String(Double(quotesDetailResponse.open) ?? 0)),
            QuotesInformation(title1: "High", value1: String(Double(quotesDetailResponse.high) ?? 0), title2: "Low", value2: String(Double(quotesDetailResponse.low) ?? 0)),
            QuotesInformation(title1: "Volume", value1: String(Int(quotesDetailResponse.volume) ?? 0) , title2: "Change Perc.", value2: quotesDetailResponse.changePercent),
            QuotesInformation(title1: "Change", value1: String(Double(quotesDetailResponse.change) ?? 0), title2: "Prev. close ", value2: String(Double(quotesDetailResponse.previousClose) ?? 0)),
        ]
      
        view?.setQuotesInformation(quotesDetail: quotesDetail)
//        self.quotesDetailCollectionview.reloadData()
        print(quotesDetail)
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
        print(companyOverviewDetail)
//        self.companyOverviewCollectionView.reloadData()
        
    }
    
    func didGetLineChartData(data : [String : TimeSeriesDaily]) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var dates : [Date] = []
        var close : [Double] = []
        
        var newDict : [Date : Double] = [:]
        
//       looping over the dictionary provided by the api in order to separate keys and values and put them in their corresponding array.
        for (key, value) in data {
            
            let keyDate = dateFormatter.date(from: key) // string -> date
            dates.append(keyDate!)
            close.append(Double(value.close)!)
            
        }
        
//      adding keys and values in a new dictionary
        for i in 0...data.count-1 {
            newDict[dates[i]] = close[i]
        }
        
//      sorting the new dictionary by date
        let orderedKeysAndValues = newDict.sorted(by: {$0.0 < $1.0})
        
//      dividing the new dictionary
        var datesArray : [Date] = []
        var closeArray : [Double] = []
        
        for (key,value) in orderedKeysAndValues {
            datesArray.append(key)
            closeArray.append(value)
        }
        
//      date -> string
        
        var datesString : [String] = []
        let formatter = DateFormatter()
        formatter.dateStyle = .short // short date format
        
        for i in 0...datesArray.count-1 {
            datesString.append(formatter.string(from: datesArray[i]))
        }
        
        view?.makingLineChart(datesString, closeArray)
        
    }
    
    func didSelectBuyStock(_ stockSelected: BestMatches) {
        router?.goToBuyStockViewController(stockSelected)
    }
    
    
}
