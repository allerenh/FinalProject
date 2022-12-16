//
//  CoreDataManager.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 15/12/22.
//

import Foundation
import CoreData
import UIKit

 

class CoreDataManager {
    
    private var managedContext:NSManagedObjectContext!
    private var fetchPortfolio:NSFetchRequest<NSManagedObject>!
    
    public static var shared = CoreDataManager()
    
    private init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else  {return}
        managedContext = appDelegate.persistentContainer.viewContext
        setupManager()
    }
    
    private func setupManager() {
        fetchPortfolio = NSFetchRequest<NSManagedObject>(entityName:  Entity.portfolio.rawValue)
    }
    
    
    func fetchPortfolios()->[PortfolioData]? {
        
        guard fetchPortfolio != nil  else  {return nil}
        var dataPortfolio: [NSManagedObject] = []
        var portfolioList: [PortfolioData] = []
        do {
            
            dataPortfolio = try managedContext.fetch(fetchPortfolio)
            
            dataPortfolio.forEach { item in
                
                guard let symbol = item.value(forKey: "symbol") as? String,
                      let name = item.value(forKey: "name") as? String,
                      let purchaseDate = item.value(forKey: "purchaseDate") as? Date,
                      let transactionAmount = item.value(forKey: "transactionAmount") as? Double,
                      let actualPrice = item.value(forKey: "actualPrice") as? Double,
                      let transactionIdentifier = item.value(forKey: "transactionIdentifier") as? Bool else  {return}
                
                let portfolio = PortfolioData(symbol: symbol, name: name, purchaseDate: purchaseDate, transactionAmount: transactionAmount, actualPrice: actualPrice, transactionIdentifier: transactionIdentifier)
                
                portfolioList.append(portfolio)
                
            }
            
            portfolioList.sort(by: { $0.purchaseDate > $1.purchaseDate })
            return portfolioList
        }catch let error {
            print(error)
            return nil
        }
    }
    
    func savePortfolio(_ portfolio: PortfolioData) {
        
        guard let portfolioEntity = NSEntityDescription.entity(forEntityName: Entity.portfolio.rawValue, in: managedContext
                                                               
        ) else {return}
        
        
        let portfolioObject = NSManagedObject(entity: portfolioEntity, insertInto: managedContext)
        
        portfolioObject.setValue(portfolio.name, forKey: "name")
        portfolioObject.setValue(portfolio.symbol, forKey: "symbol")
        portfolioObject.setValue(portfolio.purchaseDate, forKey: "purchaseDate")
        portfolioObject.setValue(portfolio.transactionAmount, forKey: "transactionAmount")
        portfolioObject.setValue(portfolio.transactionIdentifier, forKey: "transactionIdentifier")
        
        do {
            try managedContext.save()
        }
        
        catch {
             print ("There was an error") 
        }
        
    }
    
}

    enum Entity:String {
    case portfolio = "PortfolioEntity"

}

 


