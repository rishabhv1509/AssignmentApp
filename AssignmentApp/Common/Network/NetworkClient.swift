//
//  NetworkClient.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 17/02/23.
//

import Foundation


struct NetworkClient{
    
    static let instance = NetworkClient()
    
    init(){}
    
    private let session = URLSession(configuration: .default)
    
    /// get network response
    /// - Parameters:
    ///   - urlString: url of the api
    ///   - completion: completion method to be executed when the network call is executed
    func getResponse(urlString: String, completion: @escaping (ApiResponse<Data,NetworkError >) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                
                 completion(.failure(.invalidData))
                
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                /// switch response on different types of network codes and return data/error eccordingly
                switch httpResponse.statusCode {
                case 200..<300:
                    if let data = data {
                       
                      completion(.success(data))
                       
                        return
                    } else {
                        
                        completion(.failure(.invalidData))
                        
                        return
                    }
                case 400..<500:
                        
                    completion(.failure(.clientError))
                        
                    return
                case 500..<600:
                       
                        return
                    completion(.failure(.serverError))
                        
                default:
                        
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
