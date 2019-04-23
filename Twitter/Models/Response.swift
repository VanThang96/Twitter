//
//  Data.swift
//  Twitter
//
//  Created by win on 4/20/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation

struct Response : Decodable {
    let users : [User]?
    let tweets : [Tweet]?
}
