//
//  TransactionStatusInteractor.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionStatusInteractorProtocol {
    
    func savePortfolio(portfolio: PortfolioData)
    
}

class TransactionStatusInteractor: TransactionStatusInteractorProtocol {

    weak var presenter: TransactionStatusPresenterProtocol?
    
    func savePortfolio(portfolio: PortfolioData) {
        CoreDataManager.shared.savePortfolio(portfolio)
    }
    
    
}
