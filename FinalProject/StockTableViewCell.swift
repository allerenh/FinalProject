//
//  StockTableViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 1/12/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var stockSymbolLabel: UILabel!
    @IBOutlet weak var stockRegionLabel: UILabel!
    @IBOutlet weak var stockCurrencyLabel: UILabel!
    
   

    func setup(bestMatches: BestMatches) {
        stockNameLabel.text = bestMatches.name
        stockSymbolLabel.text = bestMatches.symbol
        stockRegionLabel.text = bestMatches.region
        stockCurrencyLabel.text = bestMatches.currency
        
    }

}
