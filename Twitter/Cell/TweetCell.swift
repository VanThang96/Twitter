//
//  TweetCell.swift
//  Twitter
//
//  Created by win on 4/17/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    var tweet : Tweet? {
        didSet{
            let atributedText = NSMutableAttributedString(string: (tweet?.user.name)!, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            
            let stringNameUser = "  \((tweet?.user.userName)!)\n"
            atributedText.append(NSAttributedString(string: stringNameUser, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            let range = NSMakeRange(0, atributedText.string.count)
            atributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            atributedText.append(NSAttributedString(string: (tweet?.message)!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = atributedText
            profileImageView.image = tweet?.user.profileImage
        }
    }
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let messageTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.25)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.isHidden = false
        return lineView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        let profileImageConstraints = [profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                                       profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                       profileImageView.widthAnchor.constraint(equalToConstant: 50),
                                       profileImageView.heightAnchor.constraint(equalToConstant: 50)]
        NSLayoutConstraint.activate(profileImageConstraints)
        
        addSubview(separatorLineView)
        let separatorLineViewConstraint = [
            separatorLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorLineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        NSLayoutConstraint.activate(separatorLineViewConstraint)
        
        addSubview(messageTextView)
        let messageTextViewConstraints = [messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                                          messageTextView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
                                          messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                                          messageTextView.bottomAnchor.constraint(equalTo: separatorLineView.topAnchor)]
        NSLayoutConstraint.activate(messageTextViewConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
