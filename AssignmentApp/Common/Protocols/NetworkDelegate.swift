//
//  NetworkDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 01/03/23.
//

import Foundation

protocol NetworkDelegate : AnyObject {
    func networkResponseRecieved(_ data:  ApiResponse<Data,NetworkError>)
}

