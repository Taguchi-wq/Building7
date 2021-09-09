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
    private static func createBasicAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        return alert
    }
    
    /// パスワードが間違ってることをしらせるアラート
    static func presentIncorrectPassword() {
        let alert = createBasicAlert(title: "エラー", message: "コードが間違っています。やり直してください。", handler: nil)
        alert.present()
    }
    
    /// データが取得できなかったことを知らせるアラート
    /// - Parameter messege: メッセージ
    static func presentInvalidData(messege: NetworkError) {
        let alert = createBasicAlert(title: "エラー", message: messege.rawValue) { _ in fatalError("データ取得に失敗したのでアプリを落とす")
        }
        alert.present()
    }
    
    /// 現在の階数が取得できなかったことを知らせるアラート
    /// - Parameters:
    ///   - message: メッセージ
    static func presentInvalidCurrentFloor(message: NetworkError) {
        let alert = createBasicAlert(title: "エラー", message: message.rawValue, handler: nil)
        alert.present()
    }
    
    /// 位置情報の使用許可を促すアラート
    static func presentLocationInformationPermission() {
        // 位置情報の設定画面
        let settingAppURL = URL(string: UIApplication.openSettingsURLString)!
        let alert = createBasicAlert(title: "位置情報が利用できません",
                                     message: "位置情報を使用することが許可されていません。”設定”で位置情報へのアクセスを有効にしてください",
                                     handler: nil)
        alert.addAction(UIAlertAction(title: "設定", style: .default) { _ in
            UIApplication.shared.open(settingAppURL, options: [:], completionHandler: nil)
        })
        alert.present()
    }
    
}
