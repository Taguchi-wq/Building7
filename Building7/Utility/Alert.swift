//
//  Alert.swift
//  Building7
//
//  Created by cmStudent on 2021/07/29.
//

import UIKit

class Alert {
    
    /// ベーシックなアラートを作成する
    /// - Parameter title: タイトル
    /// - Parameter handler: OKボタンを押した時の処理
    /// - Returns: アラート
    private static func createBasicAlert(title: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: String(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        return alert
    }
    
    /// パスワードが間違ってることをしらせるアラート
    /// - Parameter viewController: アラートを表示するUIViewController
    static func presentIncorrectPassword(on viewController: UIViewController) {
        let alert = createBasicAlert(title: "コードが間違っています。\nやり直してください。", handler: nil)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
    /// データが取得できなかったことをしたせるアラート
    /// - Parameter viewController: アラートを表示するUIViewController
    static func presentInvalidData(on viewController: UIViewController, title: String) {
        let alert = createBasicAlert(title: title) { _ in fatalError("データ取得に失敗したのでアプリを落とす") }
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
}
