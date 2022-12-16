//
//  BuyStockConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation
import UIKit

class TransactionStockConfigurator {
    static func makeBuyStock(_ stockSelected: BestMatches, _ stockPrice:Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool) -> UIViewController {
        
        let presenter = TransactionStockPresenter(stockSelected: stockSelected, stockPrice: stockPrice, dailyStockPrice: dailyStockPrice, transactionIdentifier: transactionIdentifier)
        let interactor = TransactionStockInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "BuyStockViewController") as? TransactionStockViewController else {
                return UIViewController()
            }
        
        let router = TransactionStockRouter()
        
        vc.presenter = presenter
    
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
       
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
}
