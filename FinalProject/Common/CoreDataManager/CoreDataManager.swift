//
//  CoreDataManager.swift
//  FinalProject
//
//  Created by Ana Isabel Llerena Huayta on 15/12/22.
//

import Foundation
import CoreData
import UIKit

 
//  Core Data:  to save your application’s permanent data for offline use, to cache temporary data, and to add undo functionality to your app on a single device.

// The data model sets up the classes that collaboratively support your app’s model layer.

// These classes are referred to collectively as the Core Data stack:
// NSPersistentContainer:  sets up the model, context, and store coordinator all at once.
//  - NSManagedObjectModel: represents your app’s model file describing your app’s types, properties, and relationships.
//  - NSManagedObjectContext: tracks changes to instances of your app’s types.
//  - NSPersistentStoreCoordinator: saves and fetches instances of your app’s types from stores.

class CoreDataManager {
    
    private var managedContext:NSManagedObjectContext!
    private var fetchPortfolio:NSFetchRequest<NSManagedObject>!
    
    
//    It initializes your class instance single time only with static property and it will share your class instance globally.
    public static var shared = CoreDataManager()
    
    
    init() {
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
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func savePortfolio(_ portfolio: PortfolioData) {
        
        guard let portfolioEntity = NSEntityDescription.entity(forEntityName: Entity.portfolio.rawValue, in: managedContext) else {return}
        
        let portfolioObject = NSManagedObject(entity: portfolioEntity, insertInto: managedContext)
        
        portfolioObject.setValue(portfolio.name, forKey: "name")
        portfolioObject.setValue(portfolio.symbol, forKey: "symbol")
        portfolioObject.setValue(portfolio.purchaseDate, forKey: "purchaseDate")
        portfolioObject.setValue(portfolio.transactionAmount, forKey: "transactionAmount")
        portfolioObject.setValue(portfolio.actualPrice, forKey: "actualPrice")
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

 


