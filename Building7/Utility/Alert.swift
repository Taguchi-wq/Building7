//
//  Alert.swift
//  Building7
//
//  Created by cmStudent on 2021/07/29.
//

import UIKit

class Alert {
    
    /// ベーシックなアラートを作成する
    /// - Parameter title: アラートのタイトル
    /// - Returns: アラート
    private static func createBasicAlert(title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: String(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
    
    /// パスワードが間違ってることをしらせるアラート
    /// - Parameter viewController: アラートを表示するUIViewController
    static func presentIncorrectPassword(on viewController: UIViewController) {
        let alert = createBasicAlert(title: "コードが間違っています。\nやり直してください。")
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
}
