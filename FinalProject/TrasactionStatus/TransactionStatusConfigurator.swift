//
//  TransactionStatusConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation
import UIKit

class TransactionStatusConfigurator {
    
    static func makeTransactionStatus (_ stockSelected: BestMatches, _ stockPrice:Double,_ purchaseAmountValue: Double,_ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool) -> UIViewController {
        
        let presenter = TransactionStatusPresenter(stockSelected: stockSelected, stockPrice: stockPrice, transactionAmount: purchaseAmountValue, dailyStockPrice: dailyStockPrice, transactionIdentifier: transactionIdentifier)
        let interactor = TransactionStatusInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TransactionStatusViewController") as? TransactionStatusViewController else {
            return UIViewController()
        }
        
        let router = TransactionStatusRouter()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
}
