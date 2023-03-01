//
//  CoreDataService.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation
import UIKit
import CoreData


/// Service to fetch and save data from DB
struct CoreDataService {
    
    static let instance = CoreDataService()
    
    private var appDelegate : AppDelegate
    private var managedContext : NSManagedObjectContext
    
    var coreDataDelegate : CoreDataDelegate!
    
    init() {
        appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
 // TODO: Add errors as well to data wrapper
    
    
    /// fetch data from DB
    func fetchDataFromDb(){
        
        var coreItemsList : [Item] = []
        var storeData : DataWrapper<[Item], LocalizedError> = DataWrapper()
        
        do {
            
            let result = try managedContext.fetch(CoreItem.fetchRequest())
            if(!result.isEmpty){
                
                for item in result {
                    coreItemsList.append(try! Item(coreItem: item))
                }
                
            }
            storeData.response = coreItemsList
            coreDataDelegate.fetchCoreData(storeData)
        } catch let error as NSError {
            storeData.error = error
            coreDataDelegate.fetchCoreData(storeData)
        }
    }
    
    /// Save items in DB
    /// - Parameter items: list of store items
    func saveDataInDb(items : [Item] ){
        do{
            try managedContext.execute(NSBatchDeleteRequest(fetchRequest: CoreItem.fetchRequest()))
            for item in items {
                let itemEntity = CoreItem(context: managedContext)
                itemEntity.name = item.name
                itemEntity.price = item.price
                itemEntity.extra = item.extra
                itemEntity.image = item.image
                try  managedContext.save()
            }
        }catch{
            print("Error while saving")
        }
    }
    
    
}
