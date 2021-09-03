//
//  UIAlertController+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/09/03.
//

import UIKit

extension UIAlertController {

    // MARK: - Private Funcs
    private func presentFromController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navigationVC = viewController as? UINavigationController,
           let visibleVC = navigationVC.visibleViewController {
            presentFromController(visibleVC, animated: animated, completion: completion)
        } else {
            if let tabVC = viewController as? UITabBarController,
               let selectedVC = tabVC.selectedViewController {
                presentFromController(selectedVC, animated: animated, completion: completion)
            } else {
                DispatchQueue.main.async { viewController.present(self, animated: animated, completion: completion) }
            }
        }
    }
    
    
    // MARK: - Funcs
    /// アラートを画面に表示する
    func present() {
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            presentFromController(rootVC, animated: true, completion: nil)
        }
    }
    
}
