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
        DispatchQueue.main.async {
            do {
                let result = try self.managedContext.fetch(CoreItem.fetchRequest())
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
                self.coreDataDelegate.fetchedCoreData(storeData)
            } catch  {
                storeData.error = NetworkError.invalidURL
                self.coreDataDelegate.fetchedCoreData(storeData)
            }
        }
    }
    
    /// Save items in DB
    /// - Parameter items: list of store items
    func saveDataInDb(items : [Item] ){
       deleteAll()
        DispatchQueue.main.async {
            do{
                
                for item in items {
                    let itemEntity = CoreItem(context: self.managedContext)
                    itemEntity.name = item.name
                    itemEntity.price = item.price
                    itemEntity.extra = item.extra
                    itemEntity.image = item.image
                    
                    try  self.managedContext.save()
                    
                }
                
            }catch{
                print("Error while saving")
            }
        }
    }
    
    func deleteAll(){
        DispatchQueue.main.async {
            do{
                try self.managedContext.execute(NSBatchDeleteRequest(fetchRequest: CoreItem.fetchRequest()))
            } catch {
                print("error in deleting")
            }
        }
    }
    
}
