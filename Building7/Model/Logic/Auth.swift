//
//  Auth.swift
//  Building7
//
//  Created by cmStudent on 2021/07/30.
//

import Foundation

class Auth {
    
    // MARK: - Initializer
    private init() {
        appendPassword()
    }
    
    
    // MARK: - Static Properties
    /// Authのshared
    static let shared = Auth()
    
    
    // MARK: - Private Properties
    /// パスワード
    private var password: [Password] = []
    
    
    // MARK: - Properties
    /// 新規ユーザーかどうか
    var isNewUser: Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    
    // MARK: - Private Funcs
    /// 新規ユーザーでないことを設定する
    private func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
    
    // MARK: - Funcs
    /// ログインする
    /// - Parameters:
    ///   - password: パスワード
    ///   - success: ログインに成功した時の処理
    ///   - failure: ログインに失敗した時の処理
    func login(_ password: String, success: (() -> ()), failure: (() -> ())) {
        let code = self.password.first?.code
        if code == password {
            setIsNotNewUser()
            success()
        } else {
            failure()
        }
    }
    
}


// MARK: - API通信
extension Auth {
    
    /// ログインパスワードをpassword配列に格納する
    private func appendPassword() {
        NetworkManager.shared.loadPassword { result in
            switch result {
            case .success(let password):
                self.password.append(contentsOf: password)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
