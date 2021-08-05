//
//  DepartmentTeacherSection.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

struct DepartmentTeacherSection {
    
    // MARK: - Properties
    /// cellの数
    let items: Int
    
    
    // MARK: - Funcs
    /// ヘッダーを作成する
    func createHeader(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentSectionHeader = collectionView.dequeueReusableView(DepartmentSectionHeader.self, for: indexPath)
        departmentSectionHeader.initialize(sectionName: "先生")
        return departmentSectionHeader
    }
    
}


// MARK: - Section
extension DepartmentTeacherSection: Section {
    
    // MARK: - Properties
    /// cellの数
    var numberOfItems: Int {
        return items
    }
    
    
    // MARK: - Funcs
    /// 先生のレイアウト
    /// - Returns: 先生のレイアウト
    func sectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/4),
            heightDimension: .fractionalHeight(1/7)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
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
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
    
    /// cellを作成する
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let teacherCell = collectionView.dequeueReusableCell(TeacherCell.self, for: indexPath)
        return teacherCell
    }
    
}
