//
//  UIColor+Extension.swift
//  FacebookMe
//
//  Created by 이현호 on 2020/06/20.
//  Copyright © 2020 tempYsoup. All rights reserved.
//
import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
      self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }
    
    convenience init(hex: Int) {
      self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
}
