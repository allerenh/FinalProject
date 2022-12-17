//
//  StockDetailViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 4/12/22.
//

import UIKit
import Charts

protocol StockDetailViewProtocol: AnyObject {
    
    func showSellButton()
    func setDailyClosePrice(dailyClosePrice: [DailyClosePrice])
    func setStockPrice(stockPrice: Double)
    func setQuotesInformation(quotesDetail: [QuotesInformation])
    func setCompanyOverviewInformation(companyOverviewDetail: [CompanyOverviewInformation])
    func setStockInformation(stockSelected: BestMatches)
    func makingLineChart(_ datesString : [String], _ closeArray: [Double])
    
}


class StockDetailViewController: UIViewController {
    
    var presenter: StockDetailPresenterProtocol?
    
    @IBOutlet weak var viewChart: LineChartView!
    @IBOutlet weak var NameAndSymbolLabel: UILabel!
    @IBOutlet weak var currencyAndCountryLabel: UILabel!
    @IBOutlet weak var quotesDetailCollectionview: UICollectionView!
    @IBOutlet weak var companyOverviewCollectionView: UICollectionView!
    @IBOutlet weak var sellButton: UIButton!
    
    
    var dailyClosePrice: [DailyClosePrice] = []
    var stockSelected: BestMatches!
    var stockPrice: Double = 0
    var quotesDetail: [QuotesInformation] = []
    var companyOverviewDetail: [CompanyOverviewInformation] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quotesDetailCollectionview.dataSource = self
        self.companyOverviewCollectionView.dataSource = self
        presenter?.onViewDidLoad()
        tabBarController?.tabBar.isHidden = true
        
    }

    @IBAction func buyButtonAction(_ sender: Any) {

        presenter?.didSelectBuyStock(stockSelected, stockPrice, dailyClosePrice)
        
    }
    
    @IBAction func sellButtonAction(_ sender: Any) {
        
        presenter?.didSelectSellStock(stockSelected, stockPrice, dailyClosePrice)
        
    }
    
    func makingLineChart(_ datesString : [String], _ closeArray: [Double]) {
        
//       This is going to be the data that the graph displays.
        var dataEntries: [ChartDataEntry] = []

        for i in 0...datesString.count-1 {
            let dataEntry = ChartDataEntry(x: Double(i), y: closeArray[i]) // setting the values of x and y
            dataEntries.append(dataEntry) // adding values to the data set
        }

        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Time Series (Daily)")   // to convert dataEntries into a LineChartDataSet
        let lineChartData = LineChartData(dataSet: lineChartDataSet) // Data object that encapsulates all data associated with a LineChart.
        
        lineChartDataSet.drawCirclesEnabled = false
        viewChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: datesString) // to customize the x axis
        
        viewChart.data = lineChartData // add the data to the chart type
        
    }
}
    



extension StockDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == quotesDetailCollectionview {
            return quotesDetail.count
        } else {
            return companyOverviewDetail.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == quotesDetailCollectionview {
            guard let cell = quotesDetailCollectionview.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? QuotesDetailCollectionViewCell else {return UICollectionViewCell()}
            cell.cellQuotesInformationSetup(quotesDetail: quotesDetail[indexPath.row])
            return cell
            
        } else {
            guard let cell = companyOverviewCollectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? CompanyOverviewDetailCollectionViewCell else  {return UICollectionViewCell()}
            cell.cellCompanyOverviewSetup(companyOverviewDetail: companyOverviewDetail[indexPath.row])
            return cell
        }
    }
}

extension StockDetailViewController: StockDetailViewProtocol {

    func showSellButton() {
        sellButton.isHidden = false
    }
    
    func setDailyClosePrice(dailyClosePrice: [DailyClosePrice]) {
        self.dailyClosePrice = dailyClosePrice
    }
    
    func setStockPrice(stockPrice: Double) {
        self.stockPrice = stockPrice
    }
    
    func setQuotesInformation(quotesDetail: [QuotesInformation]) {
        self.quotesDetail = quotesDetail
        quotesDetailCollectionview.reloadData()
    }
    
    func setCompanyOverviewInformation(companyOverviewDetail: [CompanyOverviewInformation]) {
        self.companyOverviewDetail = companyOverviewDetail
        companyOverviewCollectionView.reloadData()
    }
    
    func setStockInformation(stockSelected: BestMatches) {
        self.stockSelected = stockSelected
        self.NameAndSymbolLabel.text = "\(stockSelected.name) (\(stockSelected.symbol))"
        self.currencyAndCountryLabel.text = "\(stockSelected.currency)\n \(stockSelected.region)"
    }
}
