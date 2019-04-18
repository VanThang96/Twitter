//
//  TweetViewModel.swift
//  Twitter
//
//  Created by win on 4/18/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

class TweetViewModel {
    let tweets : [Tweet]!
    let userViewModel = UserViewModel()
    init() {
        tweets = [
            Tweet(user: userViewModel.getItemAtIndex(index: 0), message: "We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column."),
            Tweet(user: userViewModel.getItemAtIndex(index: 1), message: "We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column.")
        ]
    }
    func getAllItem() -> [Tweet]{
        return tweets
    }
    func getItemAtIndex(index : Int) -> Tweet{
        return tweets[index]
    }
    func getCount() ->Int {
        return tweets.count
    }
   
}
