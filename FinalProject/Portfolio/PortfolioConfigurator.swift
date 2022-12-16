//
//  PortfolioConfigurator.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import Foundation
import UIKit

class PortfolioConfigurator {
    
    static func makePortfolio () -> UIViewController {
        
        let presenter = PortfolioPresenter()
        let interactor = PortfolioInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PortfolioViewController") as? PortfolioViewController else {
            return UIViewController()
        }
        
        let router = PortfolioRouter()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.view = vc
        
        return vc
    }
    
}
