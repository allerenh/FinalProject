//
//  BuyStockPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionStockPresenterProtocol: AnyObject {
    
    func onViewDidLoad()
    func didSelectNext(_ transactionAmount: Double)

}

class TransactionStockPresenter: TransactionStockPresenterProtocol {

    weak var view: TransactionStockViewProtocol?
    var interactor: TransactionStockInteractorProtocol?
    var router: TransactionStockRouterProtocol?
    
    var stockSelected: BestMatches
    var stockPrice: Double
    var dailyStockPrice: [DailyClosePrice]
    var transactionIdentifier: Bool

    init(stockSelected: BestMatches, stockPrice: Double, dailyStockPrice: [DailyClosePrice], transactionIdentifier: Bool) {
        self.stockSelected = stockSelected
        self.stockPrice = stockPrice
        self.dailyStockPrice = dailyStockPrice
        self.transactionIdentifier = transactionIdentifier
    }
    
    
    func onViewDidLoad() {
        view?.setStockinformation(stockSelected, transactionIdentifier)
    }
    
    func didSelectNext(_ transactionAmount: Double) {
        router?.goToTransactionSummaryViewController(stockSelected, stockPrice,transactionAmount, dailyStockPrice, transactionIdentifier)
    }
    
}

