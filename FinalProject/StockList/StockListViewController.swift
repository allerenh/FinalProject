//
//  StockListViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 1/12/22.
//

import UIKit

protocol StockListViewProtocol {
    
    func setStockList(_ stockList:[BestMatches])
    
}


class StockListViewController: UIViewController {
    
    @IBOutlet weak var stockListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: StockListPresenterProtocol?
    
    
    var keywords: String = "Apple"
    var stockList: [BestMatches] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockListTableView.dataSource = self
        stockListTableView.delegate = self
       
    }
    

  
}

extension StockListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = stockListTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as? StockTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(bestMatches: stockList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        router
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockDetailViewController") as? StockDetailViewController else {
            return
        }
        vc.getSymbol(symbol: stockList[indexPath.row].symbol, name: stockList[indexPath.row].name, currency: stockList[indexPath.row].currency, country: stockList[indexPath.row].region)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension StockListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        keywords = searchText
        
        presenter?.didWriteAKeyword(keywords)
        
        stockListTableView.reloadData()
    }

}

extension StockListViewController: StockListViewProtocol {
    
    func setStockList(_ stockList: [BestMatches]) {
        
        self.stockList = stockList
        stockListTableView.reloadData()
    }
    
}
