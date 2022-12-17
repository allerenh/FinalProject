//
//  ViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol PortfolioViewProtocol:AnyObject {
    func setPortfolio(myPortfolio: [PortfolioData])
}


class PortfolioViewController: UIViewController {
    
    @IBOutlet weak var portfolioTableView: UITableView!
    
    var presenter: PortfolioPresenterProtocol?
    var myPortfolio: [PortfolioData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        portfolioTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.onViewWillAppear()
        tabBarController?.tabBar.isHidden = false
        navigationItem.hidesBackButton = true
    }
}

extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myPortfolio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = portfolioTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PortfolioTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(portfolio: myPortfolio[indexPath.row])
        

        return cell
    }
}



extension PortfolioViewController: PortfolioViewProtocol {
    func setPortfolio(myPortfolio: [PortfolioData]) {
        self.myPortfolio = myPortfolio
        portfolioTableView.reloadData()
    }
    
    

}
