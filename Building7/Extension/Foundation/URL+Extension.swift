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
    
}
