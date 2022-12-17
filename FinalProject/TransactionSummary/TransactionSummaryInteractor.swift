//
//  TransactionSummaryInteractor.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol TransactionSummaryInteractorProtocol {
    func savePortfolio(portfolio: PortfolioData)
}

class TransactionSummaryInteractor: TransactionSummaryInteractorProtocol {
    
    weak var presenter: TransactionSummaryPresenterProtocol?
    
    func savePortfolio(portfolio: PortfolioData) {
        CoreDataManager.shared.savePortfolio(portfolio)
    }
}
