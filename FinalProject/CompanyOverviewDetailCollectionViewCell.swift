//
//  CompanyOverviewDetailCollectionViewCell.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 11/12/22.
//

import UIKit

class CompanyOverviewDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstValueLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondValueLabel: UILabel!
    @IBOutlet weak var thirdTitleLabel: UILabel!
    @IBOutlet weak var thirdValueLabel: UILabel!
    @IBOutlet weak var fourthTitleLabel: UILabel!
    @IBOutlet weak var fourthValueLabel: UILabel!
    
    func cellCompanyOverviewSetup(companyOverviewDetail: CompanyOverviewInformation) {
        firstTitleLabel.text = companyOverviewDetail.title1
        firstValueLabel.text = companyOverviewDetail.value1
        secondTitleLabel.text = companyOverviewDetail.title2
        secondValueLabel.text = companyOverviewDetail.value2
        thirdTitleLabel.text = companyOverviewDetail.title3
        thirdValueLabel.text = companyOverviewDetail.value3
        fourthTitleLabel.text = companyOverviewDetail.title4
        fourthValueLabel.text = companyOverviewDetail.value4
       
    }
}
