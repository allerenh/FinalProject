//
//  ViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol PortfolioViewProtocol:AnyObject {
    
}


class PortfolioViewController: UIViewController {
    
    var presenter: PortfolioPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension PortfolioViewController: PortfolioViewProtocol {
    
}
