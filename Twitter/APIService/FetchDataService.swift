//
//  FetchDataService.swift
//  Twitter
//
//  Created by win on 4/23/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import Alamofire

class FetchDataService : BaseService {
    static func getListResponse(onCompletion : @escaping (_ Success : Response) -> () , onError: @escaping (_ Error : String?) -> ()){
        callfetchAPI(api: API.fetchAllUser()) { (data, bool) in
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                onCompletion(response)
                
            } catch let jsonError {
                onError(jsonError.localizedDescription)
            }
        }
    }
}
