//
//  Constants.swift
//  JSONTestingAPP
//
//  Created by Muhammad Kalim on 14/11/2019.
//  Copyright © 2019 DHA. All rights reserved.
//

import Foundation


class Api {
    
    static let instance = Api()
    
    private init(){
        
    }
    
    static var baseURL = "https://jsonplaceholder.typicode.com"
    
    struct CONSTANT_METHODS {
    
        static let ALL_POST = "\(baseURL)/posts"
    }
    
    
    struct params {
        static var allPosts = [allPostsClass.AllPosts]()
        static var statusCodeMessage = String()
    }
    
}
