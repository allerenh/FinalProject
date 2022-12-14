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
}

class StockDetailInteractor: StockDetailInteractorProtocol {
    
    weak var presenter: StockDetailPresenterProtocol?
    
    func getQuotesDetail(_ symbol: String) {
        NetworkingProvider.shared.getQuotes(symbol: symbol) { data in
            self.presenter?.didGetQuotesDetail(quotesDetailResponse: data)
        }
    }
    
    func getCompanyOverviewDetail(_ symbol: String) {
        NetworkingProvider.shared.getCompanyOverview(symbol: symbol) { data in
            self.presenter?.didGetCompanyOverview(companyResponse: data)
        }
    }
    
    
    func getLineChartDataDetail(_ symbol: String) {
        
        NetworkingProvider.shared.getChartData(symbol: symbol) { data in
           
            self.presenter?.didGetLineChartData(data: data)
        }
    }
    
}

