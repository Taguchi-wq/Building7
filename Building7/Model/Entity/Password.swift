//
//  Password.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

struct Password: Decodable {
    let code: String
    let startDate: String
    let isValid: Bool
    
    enum CodingKeys: String, CodingKey {
        case code = "password"
        case startDate
        case isValid
    }
}
