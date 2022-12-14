//
//  StockListConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 13/12/22.
//

import Foundation
import UIKit

class StockListConfigurator {
    
    static func makeStockList() -> UIViewController {
        


        let presenter = StockListPresenter()
        let interactor = StockListInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "StockListViewController") as? StockListViewController else {
            return UIViewController()
        }
            
        let router = StockListRouter()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = vc
        
        interactor.presenter = presenter
        
        return vc
        
    }
}
