//
//  TransactionStatusRouter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionStatusRouterProtocol {
    func goToPortfolioViewController(_ transactionAmount: Double,_ stockSelected: BestMatches,_ stockPrice: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool  )
}

class TransactionStatusRouter: TransactionStatusRouterProtocol {

    var view: TransactionStatusViewController?
    
    func goToPortfolioViewController(_ transactionAmount: Double, _ stockSelected: BestMatches, _ stockPrice: Double, _ dailyStockPrice: [DailyClosePrice], _ transactionIdentifier: Bool ) {
        let portfolioViewController = PortfolioConfigurator.makePortfolio()
        view?.navigationController?.pushViewController(portfolioViewController, animated: true)
    }
    
    
}

