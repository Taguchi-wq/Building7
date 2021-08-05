//
//  DepartmentDescriptionSection.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

struct DepartmentDescriptionSection {
    
    // MARK: - Properties
    /// cellの数
    let items: Int
    
    
    // MARK: - Funcs
    /// ヘッダーを作成する
    func createHeader(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentSectionHeader = collectionView.dequeueReusableView(DepartmentSectionHeader.self, for: indexPath)
        departmentSectionHeader.initialize(sectionName: "学科説明")
        return departmentSectionHeader
    }
    
}


// MARK: - Section
extension DepartmentDescriptionSection: Section {
    
    // MARK: - Properties
    /// cellの数
    var numberOfItems: Int {
        return items
    }
    
    
    // MARK: - Funcs
    /// 学科の説明のレイアウト
    /// - Returns: 学科の説明のレイアウト
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
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = .init(top: 10, leading: 20, bottom: 60, trailing: 20)
        
        return section
    }
    
    /// cellを作成する
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let descriptionCell = collectionView.dequeueReusableCell(DepartmentDescriptionCell.self, for: indexPath)
        return descriptionCell
    }
    
}
