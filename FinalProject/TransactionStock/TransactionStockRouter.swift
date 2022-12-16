//
//  BuyStockRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionStockRouterProtocol {
    
    func goToTransactionSummaryViewController(_ stockSelected: BestMatches, _ stockPrice:Double, _ transactionAmount: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool)
    
}

class TransactionStockRouter: TransactionStockRouterProtocol {

    
    
    var view: TransactionStockViewController?
    
    func goToTransactionSummaryViewController(_ stockSelected: BestMatches, _ stockPrice:Double, _ transactionAmount: Double, _ dailyStockPrice: [DailyClosePrice],_ transactionIdentifier: Bool) {
        let transactionSummaryViewController = TransactionSummaryConfigurator.makeTransactionSummary(stockSelected,stockPrice, transactionAmount, dailyStockPrice, transactionIdentifier)
        view?.navigationController?.pushViewController(transactionSummaryViewController, animated: true)
    }

}
