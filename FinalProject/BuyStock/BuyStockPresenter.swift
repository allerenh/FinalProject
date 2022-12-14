//
//  BuyStockPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol BuyStockPresenterProtocol: AnyObject {
    
    func onViewDidLoad()
    func didSelectNext()
}

class BuyStockPresenter: BuyStockPresenterProtocol {

    
    
    weak var view: BuyStockViewProtocol?
    var interactor: BuyStockInteractorProtocol?
    var router: BuyStockRouterProtocol?
    
    var stockSelected: BestMatches
    
    init(stockSelected: BestMatches) {
        self.stockSelected = stockSelected
    }
    
    func onViewDidLoad() {
        view?.setStockinformation(stockSelected)
    }
    
    func didSelectNext() {
        router?.goToTransactionSummaryViewController()
    }
    

    
}

