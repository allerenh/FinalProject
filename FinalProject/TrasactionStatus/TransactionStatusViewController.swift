//
//  TransactionStatusViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol TransactionStatusViewProtocol: AnyObject {
    func setTransactionSummary(_ stockSelected: BestMatches,_ stockPrice: Double,_ transactionAmount: Double, _ transactionIdentifier: Bool)
}

class TransactionStatusViewController: UIViewController {
    
    var presenter: TransactionStatusPresenter?

    @IBOutlet weak var purchaseAmountLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var transactionTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        presenter?.didSelectDone()
    }
}

extension TransactionStatusViewController: TransactionStatusViewProtocol {
    
    func setTransactionSummary(_ stockSelected: BestMatches,_ stockPrice: Double,_ transactionAmount: Double,_ transactionIdentifier: Bool) {
        
        if transactionIdentifier == true {
            transactionTypeLabel.text = "You have puchased"
        } else {
            transactionTypeLabel.text = "You have sold"
        }
        
        
        purchaseAmountLabel.text = "\(String(format: "%.2f", transactionAmount)) \(stockSelected.currency)"
        companyNameLabel.text = stockSelected.name
    }
    
}
