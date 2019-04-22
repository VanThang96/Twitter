//
//  Tweet.swift
//  Twitter
//
//  Created by win on 4/18/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
struct Tweet : Decodable {
    let user : User?
    let image : Image?
    let message : String?
}
