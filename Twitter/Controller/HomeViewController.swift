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
        setupNavigationBarItem()
        
        collectionView.backgroundColor = UIColor(red: 232/250, green: 236/250, blue: 242/250, alpha: 1)
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UserHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(UserFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }
    func setupNavigationBarItem(){
        let titleImageView = UIImageView(image: UIImage(named: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        let followButton = UIButton(type: .system)
        followButton.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let tweetButton = UIButton(type: .system)
        tweetButton.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        tweetButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: tweetButton),UIBarButtonItem(customView: searchButton)]
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
        //estimation height of text in cell
        let widthBodyTextView = view.frame.width - 8 - 50 - 8
        let estimatedheight = userViewModel.estimatedTextHeight(atIndex: indexPath.item, widthBodyTextView:widthBodyTextView )
        return CGSize(width: view.frame.width, height: estimatedheight + 8 + 20 + 20 + 1 + 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
