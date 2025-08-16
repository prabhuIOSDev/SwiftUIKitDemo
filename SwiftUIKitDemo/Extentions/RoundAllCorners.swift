//
//  RoundAllCorners.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 14/08/25.
//

import UIKit

// UIview
extension UIView {
    func roundAllCorners(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

//MARK: This is for UiImage view corner radius


