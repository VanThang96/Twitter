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
    // MARK : var
    var tweets : [Tweet] = []
    
    // MARK : Method
    func call(complete:@escaping ()->()){
        FetchDataService.getListResponse(onCompletion: { [weak self](response) in
            self?.tweets = response.tweets!
            complete()
        }) { (error) in
            print(error!)
        }
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
    func estimatedTextHeight(atTweet: Tweet,widthBodyTextView : CGFloat) ->CGFloat {
        //estimation height of text in cell
        let size = CGSize(width: widthBodyTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: atTweet.message!).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
}
