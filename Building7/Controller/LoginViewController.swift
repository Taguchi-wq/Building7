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
        setupNavigationBar()
    }
    
    /// 画面をタップした時の処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK: - Private Func
    /// UIButtonの設定をする
    /// - Parameter button: 設定するUIButton
    private func setupButton(_ button: UIButton) {
        button.isEnabled          = false
        button.layer.cornerRadius = 8
    }
    
    /// UITextFieldの設定をする
    /// - Parameter textField: 設定するUITextField
    private func setupTextField(_ textField: UITextField) {
        textField.delegate           = self
        textField.layer.borderWidth  = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor  = UIColor.black.withAlphaComponent(0.3).cgColor
    }
    
    /// NavigationBarの設定をする
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    /// HomeViewControllerに遷移する
    private func transitionToHomeVC() {
        guard let navigationVC = storyboard?.instantiateViewController(withIdentifier: HomeViewController.reuseIdentifier) as? UINavigationController else { return }
        guard let homeVC = navigationVC.topViewController as? HomeViewController else { return }
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    // MARK: - @IBActions
    /// ログインボタンを押した時の処理
    @IBAction private func tappedLoginButton(_ sender: UIButton) {
        guard let password = inputCodeTextField.text else { return }
        Auth.shared.login(password) {
            transitionToHomeVC()
        } failure: {
            Alert.presentIncorrectPassword()
        }
    }
    
}


// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    /// textFieldに文字が入力されたタイミングで呼ばれる
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let inputCodeTextFieldIsEmpty = inputCodeTextField.text?.isEmpty ?? false
        if inputCodeTextFieldIsEmpty {
            loginButton.notEnabled()
        } else {
            loginButton.enabled()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
