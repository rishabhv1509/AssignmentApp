//
//  CoredataDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 01/03/23.
//

import Foundation

protocol CoreDataDelegate : AnyObject {
    
    func fetchedCoreData(_ data : DataWrapper<[Item], LocalizedError>)
}
