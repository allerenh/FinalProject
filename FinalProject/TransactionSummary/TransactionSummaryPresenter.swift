//
//  TransactionSummaryPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionSummaryPresenterProtocol: AnyObject {
    
    func onViewDidLoad()
    func didSelectConfirm()
}

class TransactionSummaryPresenter: TransactionSummaryPresenterProtocol {

    weak var view: TransactionSummaryViewProtocol?
    var interactor: TransactionSummaryInteractorProtocol?
    var router: TransactionSummaryRouterProtocol?
    
    var stockSelected: BestMatches
    var stockPrice: Double
    var transactionAmount: Double
    var dailyStockPrice: [DailyClosePrice]
    var transactionIdentifier: Bool
    var portfolio: PortfolioData!
    
    init(stockSelected: BestMatches, stockPrice: Double, transactionAmount: Double, dailyStockPrice: [DailyClosePrice], transactionIdentifier: Bool) {
        self.stockSelected = stockSelected
        self.stockPrice = stockPrice
        self.transactionAmount = transactionAmount
        self.dailyStockPrice = dailyStockPrice
        self.transactionIdentifier = transactionIdentifier
    }
    
    func onViewDidLoad() {
        view?.setTransactionSummary(stockSelected, stockPrice, transactionAmount)
    }
    
    func didSelectConfirm() {
        portfolio = PortfolioData(symbol: stockSelected.symbol, name: stockSelected.name, purchaseDate: Date(), transactionAmount: transactionAmount, actualPrice: stockPrice, transactionIdentifier: transactionIdentifier)
        interactor?.savePortfolio(portfolio: portfolio)
        router?.goToTransactionStatusViewController(transactionAmount, stockSelected, stockPrice, dailyStockPrice, transactionIdentifier)
        
    }
    
}
