//
//  InformationCollectionViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 6/12/22.
//

import UIKit

class QuotesDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    
    func cellSetup(quotesDetail: QuotesInformation) {
        titleLabel.text = quotesDetail.title1
        valueLabel.text = quotesDetail.value1
        secondTitleLabel.text = quotesDetail.title2
        secondValueLabel.text = quotesDetail.value2
    }
}
