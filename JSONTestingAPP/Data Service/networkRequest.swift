//
//  networkRequest.swift
//  JSONTestingAPP
//
//  Created by Muhammad Kalim on 14/11/2019.
//  Copyright © 2019 DHA. All rights reserved.
//

import Foundation
import Alamofire

class requestManager{
    
    static let instance = requestManager()
    
    private init() {}
    
    
    func allPosts(completionhandler: @escaping (_ success:allPostsClass.Category? , Error?) -> ()){
        
        Alamofire.request(Api.CONSTANT_METHODS.ALL_POST, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).validate(statusCode: 200..<201).responseJSON {[weak self] (response) in
            print(response)
            switch response.result {
            case .success(let validResponse):
//                guard let res = response.result.value as? [String:Any] else {return}
                let data = try! JSONSerialization.data(withJSONObject: validResponse.self, options: [])
                let resultObject = try! JSONDecoder().decode(allPostsClass.Category.self, from: data)
                
                completionhandler(resultObject,nil)
            case .failure(let error):
                switch (response.response?.statusCode){
                case 404:
                    Api.params.statusCodeMessage = "not Found"
                case 401:
                    Api.params.statusCodeMessage = "unauthorized"
                case 408:
                    Api.params.statusCodeMessage = "request timeout"
                case 406:
                    Api.params.statusCodeMessage = "Unable to format response according to Accept header"
                default:
                    Api.params.statusCodeMessage = "something went wrong"
                }
                completionhandler(nil,error)

                }
            }
        }
        
    }
    

