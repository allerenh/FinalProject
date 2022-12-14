//
//  StockDetailRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 12/12/22.
//

import Foundation

protocol StockDetailRouterProtocol {
    func goToBuyStockViewController(_ stockSelected: BestMatches)
}

class StockDetailRouter: StockDetailRouterProtocol {
    
    var view: StockDetailViewController?
    
    func goToBuyStockViewController(_ stockSelected: BestMatches) {
    
        let buyStockViewController = BuyStockConfigurator.makeBuyStock(stockSelected)
        view?.navigationController?.pushViewController(buyStockViewController, animated: true)
    }
    
}
