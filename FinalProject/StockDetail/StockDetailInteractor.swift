//
//  StockDetailInteractor.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 12/12/22.
//

import Foundation

protocol StockDetailInteractorProtocol {
    func getQuotesDetail(_ symbol: String)
    func getCompanyOverviewDetail(_ symbol: String)
    func getLineChartDataDetail(_ symbol: String)
    func getPortfolio ()
}

class StockDetailInteractor: StockDetailInteractorProtocol {

    weak var presenter: StockDetailPresenterProtocol?
    
    func getQuotesDetail(_ symbol: String) {
        Networking.shared.getQuotes(symbol: symbol) {  data in
            self.presenter?.didGetQuotesDetail(quotesDetailResponse: data)
        }
    }
    
    func getCompanyOverviewDetail(_ symbol: String) {
        Networking.shared.getCompanyOverview(symbol: symbol) { data in
            self.presenter?.didGetCompanyOverview(companyResponse: data)
        }
    }
    
    func getLineChartDataDetail(_ symbol: String) {
        Networking.shared.getChartData(symbol: symbol) { data in
            self.presenter?.didGetLineChartData(data: data)
        }
    }
    
    func getPortfolio () {
        let myPortfolio = CoreDataManager.shared.fetchPortfolios()
        presenter?.didGetPortfolio(myPortfolio: myPortfolio!)
    }  
}

