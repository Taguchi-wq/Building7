//
//  Floor.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

struct Floor: Decodable {
    let name: String
    let mapImageName: String
    let restroomKind: Int
    let departments: [Department]
    
    enum CodingKeys: String, CodingKey {
        case name = "floor"
        case mapImageName
        case restroomKind
        case departments
    }
}
