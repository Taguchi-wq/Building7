//
//  DepartmentNameSection.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

struct DepartmentNameSection {
    
    // MARK: - Properties
    /// cellの数
    let items: Int
    
}


// MARK: - Section
extension DepartmentNameSection: Section {
    
    // MARK: - Properties
    /// cellの数
    var numberOfItems: Int {
        return items
    }
    
    
    // MARK: - Funcs
    /// 学科の名前のレイアウト
    /// - Returns: 学科の名前のレイアウト
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 20, bottom: 60, trailing: 20)
        
        return section
    }
    
    /// cellを作成する
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let nameCell = collectionView.dequeueReusableCell(DepartmentNameCell.self, for: indexPath)
        return nameCell
    }
    
}
