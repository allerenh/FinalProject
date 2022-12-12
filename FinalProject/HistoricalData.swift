//
//  HistoricalData.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 7/12/22.
//

import Foundation


struct HistoricalData: Decodable {

    let timeSeriesDaily: [String: TimeSeriesDaily]

    enum CodingKeys: String, CodingKey {

        case timeSeriesDaily = "Time Series (Daily)"
    }
}



struct TimeSeriesDaily: Decodable {
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String

    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}
