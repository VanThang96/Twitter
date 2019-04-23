//
//  UserFooterCell.swift
//  Twitter
//
//  Created by win on 4/15/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class UserFooterCell: UICollectionViewCell {
    // MARK : let
    let footerLabel : UILabel = {
        let label = UILabel()
        label.text = "Show see more"
        label.textColor = .cyan
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK : Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        let whiteBackground = UIView()
        whiteBackground.backgroundColor = .white
        whiteBackground.translatesAutoresizingMaskIntoConstraints = false
        addSubview(whiteBackground)
        addSubview(footerLabel)
        let whiteBackgroundConstrants = [
            whiteBackground.topAnchor.constraint(equalTo: topAnchor),
            whiteBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteBackground.bottomAnchor.constraint(equalTo: bottomAnchor,constant : -14)
        ]
        NSLayoutConstraint.activate(whiteBackgroundConstrants)
        let footerLabelConstraints = [
            footerLabel.topAnchor.constraint(equalTo: topAnchor),
            footerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            footerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant : -14)
        ]
        NSLayoutConstraint.activate(footerLabelConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
