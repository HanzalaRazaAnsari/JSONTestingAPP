//
//  allPosts.swift
//  JSONTestingAPP
//
//  Created by Muhammad Kalim on 14/11/2019.
//  Copyright © 2019 DHA. All rights reserved.
//

import Foundation
class allPostsClass{
struct AllPosts: Codable {
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
    

typealias Category = [AllPosts]
}
