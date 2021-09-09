//
//  Current.swift
//  Building7
//
//  Created by cmStudent on 2021/08/17.
//

import Foundation

struct Current: Decodable {
    /// 海面気圧
    let seaLevelPressure: Double
    /// 気温
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case seaLevelPressure = "pressure"
        case temp
    }
}
