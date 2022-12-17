//
//  StockListViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 1/12/22.
//

import UIKit

protocol StockListViewProtocol: AnyObject {
    
    func setStockList(_ stockList:[BestMatches])
    
}

class StockListViewController: UIViewController {
    
    @IBOutlet weak var stockListTableView: UITableView!
    @IBOutlet weak var searchStockBar: UISearchBar!
    
    var presenter: StockListPresenterProtocol?
    var keywords: String = ""
    var stockList: [BestMatches] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didWriteAKeyword("Apple")
        searchStockBar.placeholder = "Enter a company name or symbol"
        searchStockBar.delegate = self
        stockListTableView.dataSource = self
        stockListTableView.delegate = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
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
        presenter?.didSelectStock(indexPath.row)
    }
}

extension StockListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchText.isEmpty {
            keywords = "AAPL"
        } else {
            keywords = searchText
        }
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
