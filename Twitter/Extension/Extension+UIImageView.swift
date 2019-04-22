//
//  Extension+UIImageView.swift
//  Twitter
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func getImageFromUrl(from url: String) {
         let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
