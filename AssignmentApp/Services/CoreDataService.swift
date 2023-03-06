//
//  CoreDataService.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation
import UIKit
import CoreData

protocol CoreProto: AnyObject{
    
}
/// Service to fetch and save data from DB
class CoreDataService : CoreProto {
    
    
    var appDelegate : AppDelegate = ((UIApplication.shared.delegate as? AppDelegate)!)
    var managedContext : NSManagedObjectContext!
    var coreDataDelegate : CoreDataDelegate!
    

    
    init(appDelegate: AppDelegate, managedContext: NSManagedObjectContext!) {
        self.appDelegate = appDelegate
        self.managedContext = managedContext
        
    }
    
    init() {
        self.managedContext = appDelegate.persistentContainer.viewContext
    }
    
    
    // TODO: Add errors as well to data wrapper
    
    
    /// fetch data from DB
    func fetchDataFromDb(){
        
        var coreItemsList : [Item] = []
        var storeData : DataWrapper<[Item], NetworkError> = DataWrapper()
         
        do {
            let result = try managedContext.fetch(CoreItem.fetchRequest())
            if(!result.isEmpty){
                
                for item in result {
                    do{
                      
                        coreItemsList.append(try Item(coreItem: item))
                        
                    }catch{
                        storeData.error = NetworkError.invalidURL
                    }
                }
                
            }
            storeData.data = coreItemsList
            coreDataDelegate.fetchedCoreData(storeData)
        } catch  {
            storeData.error = NetworkError.invalidURL
            coreDataDelegate.fetchedCoreData(storeData)
        }
    }
    
    /// Save items in DB
    /// - Parameter items: list of store items
    func saveDataInDb(items : [Item] ){
        do{
            deleteAll()
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
    
    func deleteAll(){
        do{
            try managedContext.execute(NSBatchDeleteRequest(fetchRequest: CoreItem.fetchRequest()))
        } catch {
            print("error in deleting")
        }
    }
    
}
