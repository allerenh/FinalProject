//
//  StockDetailConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 13/12/22.
//

import Foundation
import UIKit

class StockDetailConfigurator {
    static func makeStockDetail(stockSelected: BestMatches) -> UIViewController {
        
        let presenter = StockDetailPresenter(stockSelected: stockSelected)
        let interactor = StockDetailInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "StockDetailViewController") as? StockDetailViewController else {
                return UIViewController()
            }
        
        let router = StockDetailRouter()
        
        vc.presenter = presenter
    
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
       
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
}
