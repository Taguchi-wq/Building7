//
//  URL+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

extension URL {
    
    // MARK: - Static Properties
    /// ログインパスワードのURL
    static var passwordURL: URL {
        return URL(string: "http://20cm0123.main.jp/building7/password.php")!
    }
    
    /// 7号館フロアのURL
    static var floorURL: URL {
        return URL(string: "http://20cm0123.main.jp/building7/floor.php")!
    }
    
    
    // MARK: - Static Funcs
    /// 天気のURL
    static func weatherURL(latitude: Double, longitude: Double) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&appid=a31aac119fcfb7fbe091b4eb7fcb74c5")!
    }
    
}
