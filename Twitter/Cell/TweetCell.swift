//
//  TweetCell.swift
//  Twitter
//
//  Created by win on 4/17/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    // MARK : var
    var tweet : Tweet? {
        didSet{
            setupProfileImage()
            let atributedText = NSMutableAttributedString(string: (tweet?.user!.name)!, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            
            let stringNameUser = "  \((tweet?.user!.username)!)\n"
            atributedText.append(NSAttributedString(string: stringNameUser, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            let range = NSMakeRange(0, atributedText.string.count)
            atributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            atributedText.append(NSAttributedString(string: (tweet?.message)!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = atributedText
        }
    }
    
    // MARK : let
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
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let replyButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "reply"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let retweetButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "retweet"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let likeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let sendButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send_message"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let separatorLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0, alpha: 0.25)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.isHidden = false
        return lineView
    }()
    
    // MARK : Method
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
                                          messageTextView.bottomAnchor.constraint(equalTo: separatorLineView.topAnchor,constant : -24)]
        NSLayoutConstraint.activate(messageTextViewConstraints)
        
        setupBottomButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupBottomButton(){
        let replyButtonContainer = UIView()
        let retweetButtonContainer = UIView()
        let likeButtonContainer = UIView()
        let sendButtonContainer = UIView()
    
        
        let buttonStackView = UIStackView(arrangedSubviews: [
                replyButtonContainer,retweetButtonContainer,likeButtonContainer,sendButtonContainer
            ])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonStackView)
        let buttonStackViewViewConstraints = [
            buttonStackView.topAnchor.constraint(equalTo: messageTextView.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(buttonStackViewViewConstraints)
        
        replyButtonContainer.addSubview(replyButton)
        let replyButtonViewConstraints = [
            replyButton.topAnchor.constraint(equalTo: replyButtonContainer.topAnchor),
            replyButton.leadingAnchor.constraint(equalTo: replyButtonContainer.leadingAnchor),
            replyButton.widthAnchor.constraint(equalToConstant: 20),
            replyButton.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(replyButtonViewConstraints)
        
        retweetButtonContainer.addSubview(retweetButton)
        let retweetButtonViewConstraints = [
            retweetButton.topAnchor.constraint(equalTo: retweetButtonContainer.topAnchor),
            retweetButton.leadingAnchor.constraint(equalTo: retweetButtonContainer.leadingAnchor),
            retweetButton.widthAnchor.constraint(equalToConstant: 20),
            retweetButton.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(retweetButtonViewConstraints)
        
        likeButtonContainer.addSubview(likeButton)
        let likeButtonViewConstraints = [
            likeButton.topAnchor.constraint(equalTo: likeButtonContainer.topAnchor),
            likeButton.leadingAnchor.constraint(equalTo: likeButtonContainer.leadingAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(likeButtonViewConstraints)
        
        sendButtonContainer.addSubview(sendButton)
        let sendButtonViewConstraints = [
            sendButton.topAnchor.constraint(equalTo: sendButtonContainer.topAnchor),
            sendButton.leadingAnchor.constraint(equalTo: sendButtonContainer.leadingAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 20),
            sendButton.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(sendButtonViewConstraints)
    }
    fileprivate func setupProfileImage(){
        if let imageUrl = tweet?.user!.profileImageUrl{
            profileImageView.getImageFromUrl(from: imageUrl)
        }
    }
}
