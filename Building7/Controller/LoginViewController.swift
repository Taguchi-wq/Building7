//
//  LoginViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/07/29.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - @IBOutlets
    /// ログインコードを入力するUITextField
    @IBOutlet private weak var inputCodeTextField: UITextField!
    /// ログインボタン
    @IBOutlet private weak var loginButton: UIButton!
    
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(loginButton)
        setupTextField(inputCodeTextField)
    }
    
    
    // MARK: - Private Func
    /// UIButtonの設定をする
    /// - Parameter button: 設定するUIButton
    private func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 8
    }
    
    /// UITextFieldの設定をする
    /// - Parameter textField: 設定するUITextField
    private func setupTextField(_ textField: UITextField) {
        textField.layer.borderWidth  = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor  = UIColor.black.withAlphaComponent(0.3).cgColor
    }
    
    
    // MARK: - @IBActions
    /// ログインボタンを押した時の処理
    @IBAction private func tappedLoginButton(_ sender: UIButton) {
        
    }
    
}
