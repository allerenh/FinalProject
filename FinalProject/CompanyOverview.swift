//
//  CompanyOverwiew.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 5/12/22.
//

import Foundation

//this struct represents the APIs answer
//decodable: json to swift
struct CompanyOverviewResponse: Decodable {
    
    let symbol: String
    let assetType: String
    let name: String
    let description: String
    let exchange: String
    let currency: String
    let country: String
    let sector: String
    let industry: String
    let marketCapitalization: String
    let ebitda: String
    let peRatio: String
    let bookValue: String
    let eps: String
    let dividendPerShare: String
    let dividendYield: String
    let profitMargin: String
    let operatingMarginTTM: String
    let returnOfAssetsTTM: String
    let returnOfEquityTTM: String
    let revenueTTM: String
    let grossProfitTTM: String
    let beta: String
    let fiftytwoWeekHigh: String
    let fiftytwoWeekLow: String
    
    //    to custom the keys provided by the api
    enum CodingKeys: String, CodingKey {
        case symbol = "Symbol"
        case assetType = "AssetType"
        case name = "Name"
        case description = "Description"
        case exchange = "Exchange"
        case currency = "Currency"
        case country = "Country"
        case sector = "Sector"
        case industry = "Industry"
        case marketCapitalization = "MarketCapitalization"
        case ebitda = "EBITDA"
        case peRatio = "PERatio"
        case bookValue = "BookValue"
        case eps = "EPS"
        case dividendPerShare = "DividendPerShare"
        case dividendYield = "DividendYield"
        case profitMargin = "ProfitMargin"
        case operatingMarginTTM = "OperatingMarginTTM"
        case returnOfAssetsTTM = "ReturnOnAssetsTTM"
        case returnOfEquityTTM = "ReturnOnEquityTTM"
        case revenueTTM = "RevenueTTM"
        case grossProfitTTM = "GrossProfitTTM"
        case beta = "Beta"
        case fiftytwoWeekHigh = "52WeekHigh"
        case fiftytwoWeekLow = "52WeekLow"
    }
    
}
