//
//  PortfolioTableViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 15/12/22.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    
    func setup(portfolio: PortfolioData) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        nameLabel.text = portfolio.name
        dateLabel.text = dateFormatter.string(from: portfolio.purchaseDate)
        quantityLabel.text = String(format: "%.2f",portfolio.shares) + " \(portfolio.symbol)"
        amountLabel.text = String(format:"%.2f", portfolio.transactionAmount) + " USD"
        
        if (portfolio.transactionIdentifier == false) {
            quantityLabel.textColor = .red
            amountLabel.textColor = .red
        } else {
            quantityLabel.textColor = .green
            amountLabel.textColor = .green
        }
    
    }

}
