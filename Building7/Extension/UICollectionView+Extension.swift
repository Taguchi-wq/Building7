//
//  UICollectionView+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/08/02.
//

import UIKit

extension UICollectionView {
    
    /// UINibを登録する
    func registerFromNib<T: UICollectionViewCell>(type: T.Type) {
        let nibName = type.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: nibName)
    }
    
}
