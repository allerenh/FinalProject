//
//  StockListRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import Foundation
import UIKit

protocol StockListRouterProtocol {
    
    func goToStockDetailViewController(stockSelected: BestMatches)
}

class StockListRouter: StockListRouterProtocol {
    
    var view: UIViewController?
    
    func goToStockDetailViewController(stockSelected: BestMatches) {

    
        let stockDetailViewController = StockDetailConfigurator.makeStockDetail(stockSelected: stockSelected)
        view?.navigationController?.pushViewController(stockDetailViewController, animated: true)
    }
}
