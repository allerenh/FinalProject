//
//  StockTableViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 29/11/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var stockName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
