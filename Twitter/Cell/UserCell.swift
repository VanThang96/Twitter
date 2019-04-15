//
//  UserCell.swift
//  Twitter
//
//  Created by win on 4/15/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    var user : User? {
        didSet{
            usernameLabel.text = user?.name
            userAccountLabel.text = user?.userName
            bodyTextView.text = user?.bodyText
            profileImageView.image = user?.profileImage
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
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Van Thang"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let userAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "@ant"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bodyTextView : UITextView = {
        let textView = UITextView()
        textView.text = "Let's finish up the cell's design by add in the placeholder information for our subviews.  We'll start by adding in a placeholder image with a corner radius.  Next, we'll fill out the text information in the middle column."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let followButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 35 / 2
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.cyan
        button.imageView?.contentMode = .scaleAspectFit
        return button
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
        
        
        addSubview(profileImageView)
        let profileImageConstraints = [profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
        profileImageView.widthAnchor.constraint(equalToConstant: 50),
        profileImageView.heightAnchor.constraint(equalToConstant: 50)]
        NSLayoutConstraint.activate(profileImageConstraints)
        
        addSubview(followButton)
        let followButtonConstrants = [
            followButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.heightAnchor.constraint(equalToConstant: 35)
        ]
        NSLayoutConstraint.activate(followButtonConstrants)
        
        addSubview(usernameLabel)
        let userNameLabelConstraints = [
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(userNameLabelConstraints)
        
        addSubview(userAccountLabel)
        let userAccoutLabelConstraints = [
            userAccountLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            userAccountLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            userAccountLabel.heightAnchor.constraint(equalToConstant: 20),
            userAccountLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(userAccoutLabelConstraints)
        
        addSubview(separatorLineView)
        let separatorLineViewConstraint = [
            separatorLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorLineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        NSLayoutConstraint.activate(separatorLineViewConstraint)
        
        addSubview(bodyTextView)
        let bodyTextViewConstraint = [
            bodyTextView.topAnchor.constraint(equalTo: userAccountLabel.bottomAnchor),
            bodyTextView.bottomAnchor.constraint(equalTo: separatorLineView.topAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bodyTextView.leadingAnchor.constraint(equalTo: userAccountLabel.leadingAnchor)
        ]
        NSLayoutConstraint.activate(bodyTextViewConstraint)

      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
