//
//  Department.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

struct Department: Decodable {
    let classroom: String
    let name: String?
    let imageName: String?
    let description: String?
    let timetables: [Timetable]?
    let teachers: [Teacher]?
    let color: DepartmentColor?
}
