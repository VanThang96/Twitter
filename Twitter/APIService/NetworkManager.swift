//
//  NetworkManager.swift
//  Twitter
//
//  Created by win on 4/23/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation

enum APIEnvironment {
    case staging
    case qa
    case production
}

struct NetworkManager {
     static let environment: APIEnvironment = .staging
}
