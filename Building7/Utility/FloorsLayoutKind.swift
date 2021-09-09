//
//  FloorsLayoutKind.swift
//  Building7
//
//  Created by cmStudent on 2021/08/16.
//

import Foundation

/// フロアのセクション
public enum FloorsLayoutKind: CaseIterable {
    case floor10, floor9, floor8, floor7, floor6, floor5, floor4, floor3, floor2, floor1, floorB1, floorB2
    
    var index: Int {
        switch self {
        case .floor10: return 9
        case .floor9:  return 8
        case .floor8:  return 7
        case .floor7:  return 6
        case .floor6:  return 5
        case .floor5:  return 4
        case .floor4:  return 3
        case .floor3:  return 2
        case .floor2:  return 1
        case .floor1:  return 0
        case .floorB1: return 10
        case .floorB2: return 11
        }
    }
    
}
