//
//  DepartmentImageSection.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

struct DepartmentImageSection {
    
    // MARK: - Properties
    /// cellの数
    let items: Int
    /// デリゲート
    weak var delegate: DepartmentImageCellDelegate?
    
}


// MARK: - Section
extension DepartmentImageSection: Section {
    
    // MARK: - Properties
    /// cellの数
    var numberOfItems: Int {
        return items
    }
    
    
    // MARK: - Funcs
    /// 学科の画像のレイアウト
    /// - Returns: 学科の画像のレイアウト
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1/3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    /// cellを作成する
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let imageCell = collectionView.dequeueReusableCell(DepartmentImageCell.self, for: indexPath)
        imageCell.delegate = delegate
        return imageCell
    }
    
}
