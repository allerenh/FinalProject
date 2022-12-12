//
//  StockListPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import Foundation

protocol StockListPresenterProtocol {
    
    func didWriteAKeyword(_ keywords: String)
    func didGetStockList(_ stockList:[BestMatches])
}

class StockListPresenter: StockListPresenterProtocol {
    
    var view: StockListViewProtocol?
    var interactor: StockListInteractorProtocol?
    var router: StockListRouterProtocol?
    
    
    
    func didWriteAKeyword(_ keywords: String) {
        interactor?.getStockList(keywords)
    }
    
    func didGetStockList(_ stockList: [BestMatches]) {
        view?.setStockList(stockList)
        
    }
    
}
