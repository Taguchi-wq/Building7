//
//  FloorSection.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

struct FloorSection {
    
    // MARK: - Properties
    /// cellの数
    let items: Int
    
    // MARK: - Funcs
    /// ヘッダーを作成する
    func createHeader(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentHeder = collectionView.dequeueReusableView(DepartmentHeder.self, for: indexPath)
        return departmentHeder
    }
    
}


// MARK: - Section
extension FloorSection: Section {
    
    // MARK: - Properties
    /// cellの数
    var numberOfItems: Int {
        return items
    }
    
    
    // MARK: - Funcs
    /// フロアのセクション
    /// - Returns: フロアのセクション
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(3/5),
            heightDimension: .fractionalHeight(1/4)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 16, leading: 20, bottom: 16, trailing: 20)
        
        return section
    }
    
    /// cellを作成する
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let departmentCell = collectionView.dequeueReusableCell(DepartmentCell.self, for: indexPath)
        return departmentCell
    }
    
}
