//
//  Tweet.swift
//  Twitter
//
//  Created by win on 4/18/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
struct Tweet {
    let user : User
    let message : String
    init(user : User , message : String) {
        self.user = user
        self.message = message
    }
}
