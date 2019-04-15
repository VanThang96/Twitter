//
//  HomeViewController.swift
//  Twitter
//
//  Created by win on 4/13/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private let cellId = "cellId"
    private let headerId = "headerId"
    private let footerId = "footerId"
    var userViewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UserHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(UserFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }
}
extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userViewModel.getCount()
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserCell
        cell.user = userViewModel.getItemAtIndex(index: indexPath.item)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            return header
        }else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            return footer
        }
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let user = userViewModel.getItemAtIndex(index: indexPath.item)
        
        //estimation height of text in cell
        let widthBodyTextView = view.frame.width - 8 - 50 - 8
        let size = CGSize(width: widthBodyTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: user.bodyText).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 8 + 20 + 20 + 1 + 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
