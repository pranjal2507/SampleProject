//
//  UIVIEW+PIN.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 25/02/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIView {

    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension UIImageView {
    func setImage(with urlString: String) {
        guard let urlString = URL(string: urlString) else {
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: urlString,
                         options: [
                            .transition(.fade(1)),
                            .cacheOriginalImage
        ])
    }
}
