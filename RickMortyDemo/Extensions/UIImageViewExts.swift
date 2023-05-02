//
//  UIImageViewExts.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import Foundation
import Kingfisher

extension UIImageView {
    func loadImage(with urlString: String?) {
        guard let urlString else {return}
        self.kf.setImage(with: URL(string: urlString))
    }
}
