//
//  StockDetailViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 29/11/22.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet weak var stockName: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockName.text = name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
