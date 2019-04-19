//
//  UserViewModel.swift
//  Twitter
//
//  Created by win on 4/15/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

class UserViewModel {
    let users : [User] = [
        User(name: "Van Thang", userName: "@ant", bodyText: "Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column.", profileImage: UIImage(named: "avatar")!),
        User(name: "Brian Voong", userName: "@letbuidthayapp", bodyText: "Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column.", profileImage: UIImage(named: "brianvoong")!),
        User(name: "Brian Advent", userName: "@brianadvent", bodyText: "Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column. Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column.", profileImage: UIImage(named: "brianadvent")!)
        
    ]
    func getAllItem() -> [User]{
        return users
    }
    func getItemAtIndex(index : Int) -> User{
        return users[index]
    }
    func getCount() ->Int {
        return users.count
    }
    func estimatedTextHeight(atIndex : Int,widthBodyTextView : CGFloat) ->CGFloat {
        let user = users[atIndex]
        //estimation height of text in cell
        let size = CGSize(width: widthBodyTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: user.bodyText).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
}
