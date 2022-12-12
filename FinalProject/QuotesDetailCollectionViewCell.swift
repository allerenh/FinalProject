//
//  InformationCollectionViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 6/12/22.
//

import UIKit

class quotesDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    
    func cellSetup(info: Information) {
        titleLabel.text = info.title1
        valueLabel.text = info.value1
        secondTitleLabel.text = info.title2
        secondValueLabel.text = info.value2
       
    }
    
}
