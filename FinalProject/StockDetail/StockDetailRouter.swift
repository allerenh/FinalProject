//
//  StockDetailRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 12/12/22.
//

import Foundation

protocol StockDetailRouterProtocol {
    func goToTransactionStockViewController(_ stockSelected: BestMatches, _ stockPrice: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool)
}

class StockDetailRouter: StockDetailRouterProtocol {
    
    var view: StockDetailViewController?

    func goToTransactionStockViewController(_ stockSelected: BestMatches, _ stockPrice: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool) {
    
        let buyStockViewController = TransactionStockConfigurator.makeTransactionStock(stockSelected, stockPrice, dailyStockPrice, transactionIdentifier)
        view?.navigationController?.pushViewController(buyStockViewController, animated: true)
    }
    
}
