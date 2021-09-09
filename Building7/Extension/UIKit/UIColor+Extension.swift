//
//  UIColor+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/08/16.
//

import UIKit

extension UIColor {
    
    /// カラーコードで初期化する
    /// - Parameter colorCode: カラーコード
    convenience init(colorCode: String?) {
        let colorCode = colorCode ?? "555555"
        let v     = Int("000000" + colorCode, radix: 16) ?? 0
        let red   = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let green = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let blue  = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
