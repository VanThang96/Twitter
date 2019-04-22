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
    var users : [User] = []
    
    func call(complete: @escaping ()->()) {
        APIRouter.shareInstance.fetchAllUser { (data, error) in
            DispatchQueue.main.async {
                 self.users = data!.users!
            }
            complete()
        }
    }
    func getAllItem() -> [User]{
        return users
    }
    func getItemAtIndex(index : Int) -> User{
        return users[index]
    }
    
    func getCount() ->Int {
        return users.count
    }
    func estimatedTextHeight(atUser: User,widthBodyTextView : CGFloat) ->CGFloat {
        //estimation height of text in cell
        let size = CGSize(width: widthBodyTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: atUser.bio!).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
}
