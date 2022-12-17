//
//  StockListInteractor.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import Foundation

protocol StockListInteractorProtocol: AnyObject {
    func getStockList(_ keywords: String)
}

class StockListInteractor: StockListInteractorProtocol {
    
    weak var presenter: StockListPresenterProtocol?
    
    func getStockList(_ keywords: String) {
        Networking.shared.getStocks(keywords: keywords, completion: { stockList in
            self.presenter?.didGetStockList(stockList)
        })
    }
}
