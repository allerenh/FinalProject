//
//  StockListPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import Foundation

protocol StockListPresenterProtocol: AnyObject {
    func didWriteAKeyword(_ keywords: String)
    func didGetStockList(_ stockList:[BestMatches])
    func didSelectStock(_ index: Int)
}

class StockListPresenter: StockListPresenterProtocol {
    
    weak var view: StockListViewProtocol?
    var interactor: StockListInteractorProtocol?
    var router: StockListRouterProtocol?
    
    var stockList : [BestMatches] = []
    
    func didWriteAKeyword(_ keywords: String) {
        interactor?.getStockList(keywords)
    }
    
    func didGetStockList(_ stockList: [BestMatches]) {
        self.stockList = stockList
        view?.setStockList(stockList)
    }
    
    func didSelectStock(_ index: Int) {
        router?.goToStockDetailViewController(stockSelected: stockList[index])
    }
}
