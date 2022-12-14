//
//  BuyStockViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 14/12/22.
//

import UIKit

protocol BuyStockViewProtocol:AnyObject {
    
    func setStockinformation(_ stockSelected: BestMatches)
    
}

class BuyStockViewController: UIViewController {
    
    
    var presenter: BuyStockPresenterProtocol?
    
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    @IBOutlet weak var number0: UIButton!
    
    @IBOutlet weak var purchaseAmount: UILabel!
    @IBOutlet weak var delete: UIButton!
    
    @IBOutlet weak var stockInformationLabel: UILabel!
    
    
    var totalPurchase: Double = 0
    var tem: Double = 0
    var decimal: Bool = false
    
    
    let kMaxLength = 4
    let kMaxValue: Double = 9999
    let kMinValue: Double = 1
    
    var temp: Double = 0
    var tempStr : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchaseAmount.text = ""
        presenter?.onViewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func number1Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    
    @IBAction func number2Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    
    @IBAction func number3Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    
    @IBAction func number4Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
        
    }
    @IBAction func number5Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func number6Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func number7Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func number8Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func number9Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")."
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    @IBAction func number0Action(_ sender: UIButton) {
        tempStr = "\(purchaseAmount.text ?? "")\(sender.tag)"
        purchaseAmount.text = tempStr
        temp = Double(tempStr) ?? 0
        print(temp)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        tempStr = ""
        purchaseAmount.text = tempStr
        temp = 0
        print(temp)
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        
        
        
    }
}

extension BuyStockViewController: BuyStockViewProtocol {
    func setStockinformation(_ stockSelected: BestMatches) {
        stockInformationLabel.text = "\(stockSelected.name) (\(stockSelected.symbol))"
    }
    
    
}
