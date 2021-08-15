//
//  Floor.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

struct Floor: Decodable {
    let floor: String
    let mapImageName: String
    let restroomKind: Int
    let departments: [Department]
}
