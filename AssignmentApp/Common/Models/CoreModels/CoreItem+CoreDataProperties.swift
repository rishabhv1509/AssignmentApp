//
//  CoreItem+CoreDataProperties.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 27/02/23.
//
//

import Foundation
import CoreData


extension CoreItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreItem> {
        return NSFetchRequest<CoreItem>(entityName: CommonStrings.entityName)
    }

    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var extra: String?
    @NSManaged public var image: String?

}

extension CoreItem : Identifiable {

}
