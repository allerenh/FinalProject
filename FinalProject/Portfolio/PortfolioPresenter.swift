//
//  PortfolioPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol PortfolioPresenterProtocol: AnyObject {
    

    func didGetPortfolio(myPortfolio: [PortfolioData])
    func onViewWillAppear()
}

class PortfolioPresenter: PortfolioPresenterProtocol {

    
    weak var view: PortfolioViewProtocol?
    var interactor: PortfolioInteractorProtocol?
    var router: PortfolioRouterProtocol?
    var portfolio: PortfolioData!
    var myPortfolio: [PortfolioData] = []

    func didGetPortfolio(myPortfolio: [PortfolioData]) {
        view?.setPortfolio(myPortfolio: myPortfolio)
    }
    
    func onViewWillAppear() {
        interactor?.getPortfolio()
    }
    
        
}
    
    
    
    

