//
//  APIRouter.swift
//  Twitter
//
//  Created by win on 4/20/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import Alamofire


class APIRouter : NSObject{
    static let shareInstance = APIRouter()
    
    func fetchAllUser(completion : @escaping (Data?,String?) -> Void){
        guard let baseURL = URL(string: "https://api.letsbuildthatapp.com/twitter/home") else {
            completion(nil,"url is wrong")
            return
        }
        Alamofire.request(baseURL, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        let data = try JSONDecoder().decode(Data.self, from: response.data! )
                        completion(data,nil)
                    }catch (let error){
                        completion(nil,error as? String)
                        print("\(error)")
                    }
                case .failure(let error):
                    completion(nil,error as? String)
                    print(error)
                }
        }
    }
}
