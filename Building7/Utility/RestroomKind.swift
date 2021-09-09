//
//  RestroomKind.swift
//  Building7
//
//  Created by cmStudent on 2021/08/17.
//

import Foundation

public enum RestroomKind: Int {
    case men         = 1
    case women       = 2
    case menAndWomen = 3
    
    /// トイレの画像名
    var imageName: String {
        switch self {
        case .men:
            return "men"
        case .women:
            return "women"
        case .menAndWomen:
            return "men_and_women"
        }
    }
    
}
