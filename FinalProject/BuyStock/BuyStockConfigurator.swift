//
//  BuyStockConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation
import UIKit

class BuyStockConfigurator {
    static func makeBuyStock(_ stockSelected: BestMatches) -> UIViewController {
        
        let presenter = BuyStockPresenter(stockSelected: stockSelected)
        let interactor = BuyStockInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "BuyStockViewController") as? BuyStockViewController else {
                return UIViewController()
            }
        
        let router = BuyStockRouter()
        
        vc.presenter = presenter
    
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
       
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
}
