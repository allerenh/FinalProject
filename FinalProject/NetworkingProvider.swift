//
//  NetworkingProvider.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 3/12/22.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    
    
    static let shared = NetworkingProvider()
    
    private let kStatusOk = 200...299
    private let apiKey = "USONIA63A43XCS0U"
    
    func getStocks(keywords: String, completion: @escaping ([BestMatches]) -> ()) {
        
        
        let url = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk ).responseDecodable(of: SearchResponse.self) { response in
            if let data = response.value?.bestMatches {
                completion(data)
                print("OK")
            } else {
                print(response.error?.responseCode ?? "ERROR")
            }
        }
    }
    
    func getQuotes(symbol:String, completion: @escaping (GlobalQuote) -> ()) {
        
        let url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(symbol)&apikey=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk ).responseDecodable(of: QuoteResponse.self) { response in
            if let data = response.value?.globalQuote {
                completion(data)
                print("OK")
            } else {
                print(response.error?.responseCode ?? "ERROR")
            }
        }
    }
    
    func getCompanyOverview(symbol: String, completion: @escaping (CompanyOverviewResponse)-> ()) {
        
        let url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=\(symbol)&apikey=\(apiKey)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable( of: CompanyOverviewResponse.self) { response in
            if let data = response.value {
                completion(data)
                print("OK")
            } else {
                print(response.error?.responseCode ?? "ERROR")
            }
        }
        
    }
    
}
