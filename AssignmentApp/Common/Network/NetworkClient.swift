//
//  NetworkClient.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 17/02/23.
//

import Foundation


class NetworkClient{
    
    var networkDelegate : NetworkDelegate?
    
    private let session = URLSession(configuration: .default)
    
    
    /// get network response
    /// - Parameters:
    ///   - urlString: url of the api
    ///   - completion: completion method to be executed when the network call is executed
    func getResponse(urlString: String) {
        
        guard let url = URL(string: urlString) else {
            self.networkDelegate?.networkResponseRecieved(.failure(.invalidURL))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.networkDelegate?.networkResponseRecieved(.failure(.invalidData))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                /// switch response on different types of network codes and return data/error eccordingly
                switch httpResponse.statusCode {
                    case 200..<300:
                        if let data = data {
                            self.networkDelegate?.networkResponseRecieved(.success(data))
                            return
                        } else {
                            self.networkDelegate?.networkResponseRecieved(.failure(.invalidData))
                            return
                        }
                    case 400..<500:
                        self.networkDelegate?.networkResponseRecieved(.failure(.clientError))
                        return
                    case 500..<600:
                        self.networkDelegate?.networkResponseRecieved(.failure(.serverError))
                        return
                    default:
                        self.networkDelegate?.networkResponseRecieved((.failure(.unexpectedError)))
                        return
                }
            }
        }.resume()
    }
}








//
// MARK: - Type Alias
//
typealias JSONDictionary = [String: Any]
typealias QueryResult = (ItemsList?, String) -> Void
