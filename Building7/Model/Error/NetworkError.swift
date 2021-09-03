//
//  NetworkError.swift
//  Building7
//
//  Created by cmStudent on 2021/08/28.
//

import Foundation

public enum NetworkError: String, Error {
    case invalidData         = "データの取得ができませんでした\nアプリを開き直してください。"
    case invalidLocation     = "現在地が取得できませんでした。\nリロードし直してください。"
    case invalidCurrentFloor = "現在の階数が取得できませんでした。\nリロードし直してください。"
}
