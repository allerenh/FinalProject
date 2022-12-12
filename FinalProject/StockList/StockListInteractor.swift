//
//  StockListInteractor.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import Foundation

protocol StockListInteractorProtocol {
    
    func getStockList(_ keywords: String)
    
}

class StockListInteractor: StockListInteractorProtocol {
    
    var presenter: StockListPresenterProtocol?
    
    func getStockList(_ keywords: String) {
//        interactor
        NetworkingProvider.shared.getStocks(keywords: keywords, completion: { stockList in
           
            self.presenter?.didGetStockList(stockList)
            
        })
    }
    
}
