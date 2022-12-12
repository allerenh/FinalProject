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
    
    var keywords: String = "Apple"
    var stockList: [BestMatches] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockListTableView.dataSource = self
        stockListTableView.delegate = self
        getStockList()
    }
    
    func getStockList() {
//        interactor
        NetworkingProvider.shared.getStocks(keywords: keywords, completion: { data in
           
            self.stockList = data
            self.stockListTableView.reloadData()
        })
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
//        router
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockDetailViewController") as! StockDetailViewController
        vc.getSymbol(symbol: stockList[indexPath.row].symbol, name: stockList[indexPath.row].name, currency: stockList[indexPath.row].currency, country: stockList[indexPath.row].region)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension StockListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        keywords = searchText
        getStockList()
        stockListTableView.reloadData()
    }

}
