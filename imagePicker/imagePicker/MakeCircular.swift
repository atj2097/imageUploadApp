//
//  MakeCircular.swift
//  imagePicker
//
//  Created by God on 10/2/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit
extension UIImageView {
    func makeCircular() -> UIImageView {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        return self
    }
}


