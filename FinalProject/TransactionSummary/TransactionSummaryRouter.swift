//
//  TransactionSummaryRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionSummaryRouterProtocol {
    
    func goToTransactionStatusViewController(_ purchaseAmountValue: Double,_ stockSelected: BestMatches,_ stockPrice: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool )
}

class TransactionSummaryRouter: TransactionSummaryRouterProtocol {

    var view: TransactionSummaryViewController?
    
    func goToTransactionStatusViewController(_ purchaseAmountValue: Double,_ stockSelected: BestMatches,_ stockPrice: Double,_ dailyStockPrice: [DailyClosePrice],_ transactionIdentifier: Bool) {
        let transactionStatusViewController = TransactionStatusConfigurator.makeTransactionStatus(stockSelected,stockPrice, purchaseAmountValue, dailyStockPrice, transactionIdentifier)
        view?.navigationController?.pushViewController(transactionStatusViewController, animated: true)
    }
    
}
