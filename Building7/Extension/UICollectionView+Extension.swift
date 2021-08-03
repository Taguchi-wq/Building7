//
//  UICollectionView+Extension.swift
//  Building7
//
//  Created by cmStudent on 2021/08/02.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Funcs
    /// UICollectionViewCellを登録する
    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        let nibName = type.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    /// UICollectionReusableViewを登録する
    func registerReusableView<T: UICollectionReusableView>(type: T.Type) {
        let nibName = type.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
}
