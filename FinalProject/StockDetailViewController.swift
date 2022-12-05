//
//  StockDetailViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 4/12/22.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet weak var NameAndSymbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var previousCloseLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var changePercent: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var sectorLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var betaLabel: UILabel!
    @IBOutlet weak var ebitdaLabel: UILabel!
    @IBOutlet weak var peRatioLabel: UILabel!
    @IBOutlet weak var epsLabel: UILabel!
    @IBOutlet weak var bookValueLabel: UILabel!
    @IBOutlet weak var marketCapitalizationLabel: UILabel!
    
    var symbol: String = ""
    var name: String = ""
   
    
    
    @IBAction func transactionButtonAction(_ sender: Any) {
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
        getCompanyOverview()
        self.NameAndSymbolLabel.text = "\(self.name) (\(self.symbol))"

    }
    
    func getDetail() {
        NetworkingProvider.shared.getQuotes(symbol: symbol) { data in
            self.setDetail(detailResponse: data)
        }
    }
    
    func getCompanyOverview() {
        NetworkingProvider.shared.getCompanyOverview(symbol: symbol) { data in
            self.setCompanyOverview(companyResponse: data)
        }
    }
    
    func getSymbol(symbol: String, name:String) {
        self.symbol = symbol
        self.name = name
    }
    
    func setDetail(detailResponse: GlobalQuote) {
        self.priceLabel.text = "Price: \(detailResponse.price ?? "")"
        self.openLabel.text = "Open: \(detailResponse.open ?? "")"
        self.highLabel.text = "High: \(detailResponse.high ?? "")"
        self.lowLabel.text = "Low: \(detailResponse.low ?? "")"
        self.volumeLabel.text = "Volume: \(detailResponse.volume ?? "")"
        self.previousCloseLabel.text = "Previous close: \(detailResponse.previousClose ?? "")"
        self.changeLabel.text = "Change: \(detailResponse.change ?? "")"
        self.changePercent.text = "Change %: \(detailResponse.changePercent ?? "")"
        
    }
 
    func setCompanyOverview(companyResponse: CompanyOverviewResponse){
       
        
        self.currencyLabel.text = "Currency: \(companyResponse.currency ?? "")"
        self.countryLabel.text = "Country: \(companyResponse.country ?? "")"
        self.sectorLabel.text = "Sector: \(companyResponse.sector ?? "")".capitalized
        self.industryLabel.text = "Industry: \(companyResponse.industry ?? "")".capitalized
        self.betaLabel.text = "Beta: \(companyResponse.beta ?? "")"
        self.ebitdaLabel.text = "EBITDA: \(companyResponse.ebitda ?? "")"
        self.peRatioLabel.text = "PE Ratio: \(companyResponse.peRatio ?? "")"
        self.epsLabel.text = "EPS: \(companyResponse.eps ?? "")"
        self.bookValueLabel.text = "Book value: \(companyResponse.bookValue ?? "")"
        self.marketCapitalizationLabel.text = "Market Cap.: \(companyResponse.marketCapitalization ?? "")"
        
    }
    

}
