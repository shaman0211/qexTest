//
//  AdvertisementModel.swift
//  qexTest
//
//  Created by Artem  on 01.09.2021.
//

import UIKit


struct Advertisements: Decodable {
    var posts: [Post]
}

struct Post: Decodable {
    var id: Int
    var name: String
    var photo: String
    var poster: UIImage?
    var description: String
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo
        case description
        case createdAt
        case updatedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photo = try container.decode(String.self, forKey: .photo)
        description = try container.decode(String.self, forKey: .description)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
}
