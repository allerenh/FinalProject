//
//  TransactionSummaryConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation
import UIKit

class TransactionSummaryConfigurator {
    
    static func makeTransactionSummary (_ stockSelected: BestMatches, _ stockPrice:Double,_ transactionAmount: Double, _ dailyStockPrice: [DailyClosePrice],_ transactionIdentifier: Bool) -> UIViewController {
        
        
        let presenter = TransactionSummaryPresenter(stockSelected: stockSelected, stockPrice: stockPrice, transactionAmount: transactionAmount, dailyStockPrice: dailyStockPrice, transactionIdentifier: transactionIdentifier)
        let interactor = TransactionSummaryInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TransactionSummaryViewController") as? TransactionSummaryViewController else {
                return UIViewController()
            }
        
        let router = TransactionSummaryRouter()
        
        vc.presenter = presenter
    
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
       
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
    
}
