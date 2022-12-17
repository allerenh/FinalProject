//
//  StockSearch.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 3/12/22.
//

import Foundation

struct SearchResponse: Decodable {
    let bestMatches: [BestMatches]
}

struct BestMatches: Decodable {
    let symbol: String
    let name: String
    let type: String
    let region: String
    let currency: String
    
    //   to custom the keys provided by the api
    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case region = "4. region"
        case currency = "8. currency"
    }    
}
