//
//  NetworkServiceProtocol.swift
//  qexTest
//
//  Created by Artem  on 02.09.2021.
//

import Foundation

protocol NetworkServiceProtocol{
    func getPosts(completion: @escaping (Advertisements) -> Void)
    func getPostImage(photo: String, completion: @escaping (Data) -> Void)
}
