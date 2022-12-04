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
    
    
    func getStocks(keywords: String, completion: @escaping ([BestMatches]) -> ()) {
        
        let apiKey = "USONIA63A43XCS0U"
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
}
