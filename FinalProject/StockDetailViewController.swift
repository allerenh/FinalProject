//
//  StockDetailViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 4/12/22.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet weak var NameAndSymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var previousCloseLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var changePercent: UILabel!
    
    var symbol: String = ""
    var name: String = ""
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
        self.NameAndSymbolLabel.text = "\(self.name) (\(self.symbol))"

       
        
    }
    
    func getDetail() {
        NetworkingProvider.shared.getQuotes(symbol: symbol) { data in
            self.setDetail(detailResponse: data)
        }
       
    }
    
    func getSymbol(symbol: String, name:String) {
        self.symbol = symbol
        self.name = name
    }
    
    func setDetail(detailResponse: GlobalQuote) {
        self.priceLabel.text = "Price: \(detailResponse.price ?? "")"
        self.openLabel.text = "Open: \(detailResponse.open ?? "")"
        self.highLabel.text = "High: \(detailResponse.high ?? "")"
        self.lowLabel.text = "Low: \(detailResponse.low ?? "")"
        self.volumeLabel.text = "Volume: \(detailResponse.volume ?? "")"
        self.previousCloseLabel.text = "Previous close: \(detailResponse.previousClose ?? "")"
        self.changeLabel.text = "Change: \(detailResponse.change ?? "")"
        self.changePercent.text = "Change %: \(detailResponse.changePercent ?? "")"
        
    }

    

}
