//
//  URL+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/08/15.
//

import Foundation

extension URL {
    
    /// ログインパスワードのURL
    static var passwordURL: URL {
        return URL(string: "http://20cm0123.main.jp/building7/password.php")!
    }
    
}
