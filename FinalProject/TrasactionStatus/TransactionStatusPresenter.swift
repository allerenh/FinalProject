//
//  TransactionStatusPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionStatusPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func didSelectDone()
}

class TransactionStatusPresenter: TransactionStatusPresenterProtocol {
    
    weak var view: TransactionStatusViewProtocol?
    var interactor: TransactionStatusInteractorProtocol?
    var router: TransactionStatusRouterProtocol?
    
    var stockSelected: BestMatches
    var stockPrice: Double
    var transactionAmount: Double
    var dailyStockPrice: [DailyClosePrice]
    var transactionIdentifier: Bool
    
    init(stockSelected: BestMatches, stockPrice: Double, transactionAmount: Double, dailyStockPrice: [DailyClosePrice], transactionIdentifier: Bool) {
        self.stockSelected = stockSelected
        self.stockPrice = stockPrice
        self.transactionAmount = transactionAmount
        self.dailyStockPrice = dailyStockPrice
        self.transactionIdentifier = transactionIdentifier
        
    }
    
    func onViewDidLoad() {
        view?.setTransactionSummary(stockSelected, stockPrice, transactionAmount, transactionIdentifier)
    }
    
    func didSelectDone() {
        router?.goToPortfolioViewController(transactionAmount, stockSelected, stockPrice, dailyStockPrice,transactionIdentifier)
    }
}
