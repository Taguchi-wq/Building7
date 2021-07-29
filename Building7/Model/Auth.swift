//
//  Auth.swift
//  Building7
//
//  Created by cmStudent on 2021/07/30.
//

import Foundation

class Auth {
    
    // MARK: - Properties
    /// パスワード
    private let password = "open2021"
    
    
    // MARK: - Func
    /// ログインする
    /// - Parameters:
    ///   - password: パスワード
    ///   - success: ログインに成功した時の処理
    ///   - failure: ログインに失敗した時の処理
    func login(_ password: String, success: (() -> ()), failure: (() -> ())) {
        if self.password == password {
            success()
        } else {
            failure()
        }
    }
    
}
