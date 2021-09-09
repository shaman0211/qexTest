//
//  NetworkService.swift
//  qexTest
//
//  Created by Artem  on 02.09.2021.
//

import Foundation

final class NetworkService {
    
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
}

extension NetworkService: NetworkServiceProtocol {
    
    func getPosts(completion: @escaping (Advertisements) -> Void) {
        let urlString = "https://scripts.qexsystems.ru/test_ios/public/api/posts"
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
               print("Network error: \(error.localizedDescription)")
               return
           }

            if let data = data {
                do {
                    let object = try self.decoder.decode(Advertisements.self, from: data)
                    completion(object)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
    
    func getPostImage(photo: String, completion: @escaping (Data) -> Void) {
        let urlString = "https://scripts.qexsystems.ru/test_ios/public\(photo.replacingOccurrences(of: "\"", with: "" ))"
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
               print("Network error: \(error.localizedDescription)")
               return
           }
            
            if let data = data {
                do {
                    completion(data)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    
}
