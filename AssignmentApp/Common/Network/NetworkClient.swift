//
//  NetworkClient.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 17/02/23.
//

import Foundation


struct NetworkClient{
    
    static let instance = NetworkClient()
    
    private init(){}
    
    private let session = URLSession(configuration: .default)
    
    var networkDelegate : NetworkDelegate!
    
    func getResponse(urlString: String, completion: @escaping (ApiResponse<Data,NetworkError >) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            self.networkDelegate.fetchNetworkResponse(.failure(.invalidURL))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.networkDelegate.fetchNetworkResponse(.failure(.invalidData))
                 completion(.failure(.invalidData))
                
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200..<300:
                    if let data = data {
                        self.networkDelegate.fetchNetworkResponse(.success(data))
                      completion(.success(data))
                       
                        return
                    } else {
                        self.networkDelegate.fetchNetworkResponse(.failure(.invalidData))
                        completion(.failure(.invalidData))
                        
                        return
                    }
                case 400..<500:
                        self.networkDelegate.fetchNetworkResponse(.failure(.clientError))
                    completion(.failure(.clientError))
                        
                    return
                case 500..<600:
                        self.networkDelegate.fetchNetworkResponse(.failure(.serverError))
                        return
                    completion(.failure(.serverError))
                        
                default:
                        self.networkDelegate.fetchNetworkResponse(.failure(.unexpectedError))
                    completion((.failure(.unexpectedError)))
                       
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
