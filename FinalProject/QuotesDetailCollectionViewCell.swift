//
//  InformationCollectionViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 6/12/22.
//

import UIKit

class QuotesDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstValueLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    
    func cellQuotesInformationSetup(quotesDetail: QuotesInformation) {
        firstTitleLabel.text = quotesDetail.title1
        firstValueLabel.text = quotesDetail.value1
        secondTitleLabel.text = quotesDetail.title2
        secondValueLabel.text = quotesDetail.value2
    }
}
