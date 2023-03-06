//
//  StoreViewModelDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 01/03/23.
//

import Foundation

protocol StoreVMDelegate : AnyObject {
    func fetchedDataFromVm(_ vmData : DataWrapper<[Item], NetworkError>)
}
