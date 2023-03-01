//
//  ViewModelDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation

protocol CustomViewControllerDelegate : AnyObject {
    func getItems() -> [Item]
}
