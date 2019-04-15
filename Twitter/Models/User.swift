//
//  UserModel.swift
//  Twitter
//
//  Created by win on 4/15/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let name : String
    let userName : String
    let bodyText : String
    let profileImage : UIImage
    init(name : String, userName : String, bodyText : String, profileImage : UIImage) {
        self.name = name
        self.userName = userName
        self.bodyText = bodyText
        self.profileImage = profileImage
    }
}
