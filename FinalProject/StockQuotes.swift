//
//  StockQuote.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 4/12/22.
//
//
//{
//"Global Quote": {
//"01. symbol": "IBM",
//"02. open": "148.1300",
//"03. high": "149.1600",
//"04. low": "147.7300",
//"05. price": "148.6700",
//"06. volume": "2899995",
//"07. latest trading day": "2022-12-02",
//"08. previous close": "149.1600",
//"09. change": "-0.4900",
//"10. change percent": "-0.3285%"
//}
//}

import Foundation

struct QuotesResponse: Decodable {
    
    let globalQuote: GlobalQuotes
    
    enum CodingKeys: String, CodingKey {
        case globalQuote = "Global Quote"
    }
}


struct GlobalQuotes: Decodable {
    
    let symbol: String
    let open: String
    let high: String
    let low: String
    let price: String
    let volume: String
    let previousClose: String
    let change: String
    let changePercent: String
    
    //    to custom the keys provided by the api
    enum CodingKeys: String, CodingKey {
        
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case volume = "06. volume"
        case previousClose = "08. previous close"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
    
}
