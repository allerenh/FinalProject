//
//  TransactionSummaryViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol TransactionSummaryViewProtocol:AnyObject {
    
    func setTransactionSummary(_ stockSelected: BestMatches,_ stockPrice: Double,_ purchaseAmountValue: Double)
    
}

class TransactionSummaryViewController: UIViewController {

    var presenter: TransactionSummaryPresenterProtocol?
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var stockPriceLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var typeTransactionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
        presenter?.didSelectConfirm()
    }
}

extension TransactionSummaryViewController: TransactionSummaryViewProtocol {
    func setTransactionSummary(_ stockSelected: BestMatches, _ stockPrice: Double, _ purchaseAmountValue: Double) {
        totalAmountLabel.text = "\(String(format: "%.2f", purchaseAmountValue)) \(stockSelected.currency)"
        symbolLabel.text = stockSelected.symbol
        stockPriceLabel.text = " \(String(stockPrice)) \(stockSelected.currency)"
        companyNameLabel.text = stockSelected.name
        typeTransactionLabel.text = stockSelected.type
        sharesLabel.text = String(format: "%.2f",(purchaseAmountValue/stockPrice))
    }
}
