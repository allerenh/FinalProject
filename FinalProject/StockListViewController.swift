//
//  StockListViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 1/12/22.
//

import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet weak var stockListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var keywords: String = ""
    var stockList: [BestMatches] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockListTableView.dataSource = self
        stockListTableView.delegate = self
        
    }
    
    func getStockList() {
        NetworkingProvider.shared.getStocks(keywords: keywords) { stockList in
            self.stockList = stockList
            self.stockListTableView.reloadData()
        }
    }
  
}

extension StockListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stockListTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockTableViewCell
        cell.setup(bestMatches: stockList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension StockListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        keywords = searchText
        getStockList()
        stockListTableView.reloadData()
    }

}
