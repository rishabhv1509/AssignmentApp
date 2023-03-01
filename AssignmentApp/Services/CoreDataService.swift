//
//  CoreDataService.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation
import UIKit
import CoreData


struct CoreDataService {
    static let instance = CoreDataService()
    var appDelegate : AppDelegate
    var managedContext : NSManagedObjectContext
    var  entity : NSEntityDescription
    var  storeItem : NSManagedObject
    
    init() {
        
        appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        managedContext = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "CoreItem", in: managedContext)!
        storeItem = NSManagedObject(entity: entity, insertInto: managedContext)
        
    }
 
    
    func getDataFromDb()->[CoreItem]{
        var result : [CoreItem] = []
        do {
             result = try managedContext.fetch(CoreItem.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return result
    }
    
    func saveDataInDb(items : [Item] ){

        for item in items {
            storeItem.setValue(item.name, forKey: "name")
            storeItem.setValue(item.price, forKey: "price")
            storeItem.setValue(item.extra, forKey: "extra")
            storeItem.setValue(item.image, forKey: "image")
        }
         
        do{
            try  managedContext.save()
        }catch{
            print("Error while saving")
        }
    }
    
  
}
