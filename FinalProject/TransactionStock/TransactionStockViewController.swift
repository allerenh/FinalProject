//
//  BuyStockViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol TransactionStockViewProtocol:AnyObject {
    
    func showNextButton()
    
    func setStockinformation(_ stockSelected: BestMatches, _ transactionIdentifier: Bool)
    
}

class TransactionStockViewController: UIViewController {
    
    
    var presenter: TransactionStockPresenterProtocol?
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var stockInformationLabel: UILabel!
    
    var transactionAmountValue: Double = 0
    var transactionAmountStr : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionAmount.text = ""
        presenter?.onViewDidLoad()
    }
    
    @IBAction func number1Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number2Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number3Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number4Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number5Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number6Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number7Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number8Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number9Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")."
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func number0Action(_ sender: UIButton) {
        transactionAmountStr = "\(transactionAmount.text ?? "")\(sender.tag)"
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = Double(transactionAmountStr) ?? 0
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        transactionAmountStr = ""
        transactionAmount.text = transactionAmountStr
        transactionAmountValue = 0
        print(transactionAmountValue)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        presenter?.didSelectNext(transactionAmountValue)
    }
}

extension TransactionStockViewController: TransactionStockViewProtocol {
    func showNextButton() {
        nextButton.isHidden = true
    }
    
    func setStockinformation(_ stockSelected: BestMatches,  _ transactionIdentifier: Bool) {
        if transactionIdentifier == true {
            transactionType.text = "Buy Stocks"
        } else {
            transactionType.text = "Sell Stocks"
        }
        stockInformationLabel.text = "\(stockSelected.name) (\(stockSelected.symbol))"
    }
}
