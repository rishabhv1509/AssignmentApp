//
//  ApiDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 01/03/23.
//

import Foundation

protocol ApiDelegate : AnyObject {
    
    func fetchedApiData(_ apiResponse: DataWrapper<StoreResponseModel, LocalizedError>)
}
