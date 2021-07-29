//
//  UIButton+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/07/29.
//

import UIKit

extension UIButton {
    
    // MARK: - Func
    /// 使用可能
    func enabled() {
        isEnabled = true
        backgroundColor = Color.green
    }
    
    /// 使用不可
    func notEnabled() {
        isEnabled = false
        backgroundColor = Color.grey
    }
    
}
