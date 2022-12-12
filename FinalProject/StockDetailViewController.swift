//
//  StockDetailViewController.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 4/12/22.
//

import UIKit
import Charts


class StockDetailViewController: UIViewController {
    

    
    @IBOutlet weak var viewChart: LineChartView!
    @IBOutlet weak var NameAndSymbolLabel: UILabel!
    @IBOutlet weak var currencyAndCountryLabel: UILabel!
    @IBOutlet weak var quotesDetailCollectionview: UICollectionView!
    @IBOutlet weak var companyOverviewCollectionView: UICollectionView!
    
    var symbol: String = ""
    var name: String = ""
    var currency: String = ""
    var country: String = ""
    var quotesDetail: [QuotesInformation] = []
    var companyOverviewDetail: [CompanyOverviewInformation] = []
   
    
    @IBAction func transactionButtonAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
        getCompanyOverview()
        getData()
        self.NameAndSymbolLabel.text = "\(self.name) (\(self.symbol))"
        self.currencyAndCountryLabel.text = "\(self.currency)\n \(self.country)"
        self.quotesDetailCollectionview.dataSource = self
        self.companyOverviewCollectionView.dataSource = self
     
        
    }
    
    
    
    func getDetail() {
        NetworkingProvider.shared.getQuotes(symbol: symbol) { data in
            self.setQuotesDetail(quotesDetailResponse: data)
        }
        self.quotesDetailCollectionview.reloadData()
    }
    
    func getCompanyOverview() {
        NetworkingProvider.shared.getCompanyOverview(symbol: symbol) { data in
            self.setCompanyOverview(companyResponse: data)
        }
    }
    
    
    func getData() {
        
        NetworkingProvider.shared.getChartData(symbol: symbol) {
            [weak self]
            data in
           
          self?.processingDataToLineChart(data: data)
        }
    }
    
    
    func getSymbol(symbol: String, name:String, currency: String, country: String) {
        self.symbol = symbol
        self.name = name
        self.currency = currency
        self.country = country
        
    }
    
    func setQuotesDetail(quotesDetailResponse: GlobalQuotes) {

       
        let quotesDetail = [
            
            QuotesInformation(title1: "Price", value1: String(Double(quotesDetailResponse.price) ?? 0), title2: "Open", value2: String(Double(quotesDetailResponse.open) ?? 0)),
            QuotesInformation(title1: "High", value1: String(Double(quotesDetailResponse.high) ?? 0), title2: "Low", value2: String(Double(quotesDetailResponse.low) ?? 0)),
            QuotesInformation(title1: "Volume", value1: String(Int(quotesDetailResponse.volume) ?? 0) , title2: "Change Perc.", value2: quotesDetailResponse.changePercent),
            QuotesInformation(title1: "Change", value1: String(Double(quotesDetailResponse.change) ?? 0), title2: "Prev. close ", value2: String(Double(quotesDetailResponse.previousClose) ?? 0)),
 
        ]
      
        self.quotesDetail = quotesDetail
        self.quotesDetailCollectionview.reloadData()
        
    }
 
    func setCompanyOverview(companyResponse: CompanyOverviewResponse){
       
        let ebitdaM = (Double(companyResponse.ebitda) ?? 0)/1000000
       
        let marketCapM = (Double(companyResponse.marketCapitalization) ?? 0)/1000000
        
        let companyOverviewDetail = [
            
            CompanyOverviewInformation(title1: "Sector", value1: companyResponse.sector.capitalized, title2: "Industry", value2: companyResponse.industry.capitalized, title3: "Asset type", value3: companyResponse.assetType, title4: "Exchange", value4: companyResponse.exchange),
            CompanyOverviewInformation(title1: "Beta", value1: companyResponse.beta, title2: "EBITDA", value2: "\(Int(ebitdaM))M", title3: "PE Ratio", value3: companyResponse.peRatio, title4: "EPS", value4: companyResponse.eps),
            CompanyOverviewInformation(title1: "Book Value P/Share ", value1: companyResponse.bookValue, title2: "Market Cap.", value2: "\(Int(marketCapM))M", title3: "52 Week high", value3: companyResponse.fiftytwoWeekHigh, title4: "52 Week low", value4: companyResponse.fiftytwoWeekLow)
        
        ]
        
        self.companyOverviewDetail = companyOverviewDetail
        
        self.companyOverviewCollectionView.reloadData()
        
    }
    
    func processingDataToLineChart(data : [String : TimeSeriesDaily]) {
        
//        NSDate objects encapsulate a single point in time, independent of any particular calendrical system or time zone. Date objects are immutable, representing an invariant time interval relative to an absolute reference date (00:00:00 UTC on 1 January 2001).
        
//        The NSDate class provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. NSDate objects can be used in conjunction with DateFormatter objects to create localized representations of dates and times, as well as with NSCalendar objects to perform calendar arithmetic.
        
//        Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects.
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var dates : [Date] = []
        var close : [Double] = []
        
        var newDict : [Date : Double] = [:]
        
//       looping over the dictionary provided by the api in order to separate keys and values and put them in their corresponding array.
        for (key, value) in data {
            
            let keyDate = dateFormatter.date(from: key) // string -> date
            dates.append(keyDate!)
            close.append(Double(value.close)!)
            
        }
        
//      adding keys and values in a new dictionary
        for i in 0...data.count-1 {
            newDict[dates[i]] = close[i]
        }
        
//      sorting the new dictionary by date
        let orderedKeysAndValues = newDict.sorted(by: {$0.0 < $1.0})
        
//      dividing the new dictionary
        var datesArray : [Date] = []
        var closeArray : [Double] = []
        
        for (key,value) in orderedKeysAndValues {
            
            datesArray.append(key)
            closeArray.append(value)
            
        }
        
//      date -> string
        
        var datesString : [String] = []
        let formatter = DateFormatter()
        formatter.dateStyle = .short // short date format
        
        for i in 0...datesArray.count-1 {
            datesString.append(formatter.string(from: datesArray[i]))
        }
        
        makingLineChart(datesString, closeArray)
        
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
            let cell = quotesDetailCollectionview.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! QuotesDetailCollectionViewCell
            
            cell.cellSetup(quotesDetail: quotesDetail[indexPath.row])
            
            return cell
        } else {
            let cell = companyOverviewCollectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! CompanyOverviewDetailCollectionViewCell
            
            cell.cellSetup(companyOverviewDetail: companyOverviewDetail[indexPath.row])
            
            return cell
        }
        

    }
    
    
}
