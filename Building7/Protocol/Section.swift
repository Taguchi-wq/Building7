//
//  Section.swift
//  Building7
//
//  Created by cmStudent on 2021/08/05.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func sectionLayout() -> NSCollectionLayoutSection
    func createCell(_ collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
}
