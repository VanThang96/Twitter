//
//  BaseService.swift
//  Twitter
//
//  Created by win on 4/23/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import Alamofire

class BaseService {
    static func callfetchAPI(api : TargetType, onCompletion : @escaping (_ response : Data , _ status : Bool)->()){
        Alamofire.request(api.baseURL, method: api.method, parameters: api.task, encoding: JSONEncoding.default, headers: api.headers).responseJSON { (response) in
            guard let data = response.data else {
                onCompletion(Data(),false)
                return
            }
            switch response.response?.statusCode {
            case 200 :
                onCompletion(data , true)
            case 201 :
                onCompletion(data , true)
            case 204 :
                onCompletion(data , true)
            default:
                onCompletion(data , false)
            }
        }
        
    }
    
}
