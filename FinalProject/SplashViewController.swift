//
//  SplashViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 3/12/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//    viewDidAppear:  Notifies the view controller that its view was added to a view hierarchy.
        goToStockListViewController()
    }
    
    
    func goToStockListViewController() {
        
        let stockListViewController = StockListConfigurator.makeStockList()
        let stockNavigation = UINavigationController(rootViewController: stockListViewController)
        stockListViewController.title = "Search"
        let portfolioViewController = PortfolioConfigurator.makePortfolio()
        let portfolioNavigation = UINavigationController(rootViewController:portfolioViewController)
        portfolioViewController.title = "Balance"
        let viewControllers = [stockNavigation,portfolioNavigation]
        let tabBar = UITabBarController()
        tabBar.viewControllers = viewControllers
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.tabBar.items![0].title = "Search"
        tabBar.tabBar.items![0].image = UIImage(named:"search")
        tabBar.tabBar.items![1].title = "Portfolio"
        tabBar.tabBar.items![1].image = UIImage(named:"portfolio")
        present(tabBar, animated: true)

    }

}
