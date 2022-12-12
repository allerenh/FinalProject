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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "StockListViewController") as? StockListViewController else {
            return
        }
            
        let presenter = StockListPresenter()
        let interactor = StockListInteractor()
        let router = StockListRouter()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = vc
        
        interactor.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: vc)
        let viewControllers = [navigation]
        let tabBar = UITabBarController()
        
        tabBar.viewControllers = viewControllers
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)

    }

}
