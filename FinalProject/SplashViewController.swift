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
        goToStockListViewController()
    }
    
    
    func goToStockListViewController() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "StockListViewController") as? StockListViewController else {
            return
        }
        
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)// to present the view controller modally
    }

}
