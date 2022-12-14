//
//  PortfolioPresenter.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation

protocol PortfolioPresenterProtocol: AnyObject {
    
    
}

class PortfolioPresenter: PortfolioPresenterProtocol {
    
    weak var view: PortfolioViewProtocol?
    var interactor: PortfolioInteractorProtocol?
    var router: PortfolioRouterProtocol?
    
    
}
