//
//  StockListViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 29/11/22.
//

import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet weak var stockListTableView: UITableView!
    
    let names = ["Apple", "Google", "Microsoft", "Tesla" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockListTableView.dataSource = self
        stockListTableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension StockListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockTableViewCell
        cell.stockName.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! StockDetailViewController
        viewController.name = names[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    
}
