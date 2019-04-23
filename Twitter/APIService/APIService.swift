//
//  APIService.swift
//  Twitter
//
//  Created by win on 4/23/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    case fetchAllUser()
}
extension API : TargetType{
    
    var environmentBaseUrl: String {
        switch NetworkManager.environment {
        case .staging:
            return "https://api.letsbuildthatapp.com/"
        case .qa:
            return "https://api.letsbuildthatapp.com/"
        case .production:
            return "https://api.letsbuildthatapp.com/"
        }
    }
    var url: String {
        return environmentBaseUrl + path
    }
    var baseURL: URL {
        guard let url = URL(string: url) else {
            fatalError("Could not configure API Please change the URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchAllUser:
            return "/twitter/home"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchAllUser:
            return .get
        }
    }
    
    var task: Parameters? {
        switch self {
        case .fetchAllUser:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchAllUser:
            return nil
        }
    }
    
}

public protocol TargetType {
    
    /// The target's base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }
    
    /// The type of HTTP task to be performed.
    var task: Parameters? { get }
    
    /// The type of validation to perform on the request. Default is `.none`.
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
    
}
