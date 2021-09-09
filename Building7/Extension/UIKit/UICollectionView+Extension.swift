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
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let nibName = type.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    /// UICollectionReusableViewを登録する
    func registerReusableView<T: UICollectionReusableView>(_ type: T.Type) {
        let nibName = type.reuseIdentifier
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
    /// UICollectionViewCellの再利用をする
    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
    
    /// UICollectionReusableViewの再利用をする
    func dequeueReusableView<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: type.reuseIdentifier,
                                                for: indexPath) as! T
    }
    
    /// スクロールしてできた上の空白に色をつける
    /// - Parameter colorCode: カラーコード
    func addTopView(colorCode: String?) {
        let frame   = CGRect(x: 0, y: -bounds.height, width: bounds.width, height: bounds.height)
        let topView = UIView(frame: frame)
        topView.backgroundColor = UIColor(colorCode: colorCode)
        addSubview(topView)
    }
    
}
