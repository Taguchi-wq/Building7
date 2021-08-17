//
//  DepartmentViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentViewController: UIViewController {
    
    // MARK: - Properties
    /// 学科
    private var department: Department!
    
    
    // MARK: - @IBOutlets
    /// 学科の詳細を表示するUICollectionView
    @IBOutlet private weak var departmentCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView(departmentCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    
    // MARK: - Initializer
    func initialize(department: Department) {
        self.department = department
    }
    
    
    // MARK: - Private Funcs
    /// NavigationBarの設定をする
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    /// UICollectionViewの設定をする
    /// - Parameter collectionView: 設定するUICollectionView
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource           = self
        collectionView.collectionViewLayout = createDepartmentLayout()
        collectionView.registerCell(DepartmentImageCell.self)
        collectionView.registerCell(DepartmentNameCell.self)
        collectionView.registerCell(DepartmentDescriptionCell.self)
        collectionView.registerCell(TeacherCell.self)
        collectionView.registerReusableView(DepartmentSectionHeader.self)
    }

}


// MARK: - Layout
extension DepartmentViewController {
    
    /// 学科画面のレイアウトのセクション
    private enum DepartmentLayoutKind: CaseIterable {
        case image, name, description, teacher
    }
    
    /// 学科のレイアウトを作る
    /// - Returns: 学科のレイアウト
    private func createDepartmentLayout() -> UICollectionViewLayout {
        let departmentLayout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let departmentLayoutKind = DepartmentLayoutKind.allCases[sectionIndex]
            switch departmentLayoutKind {
            case .image:       return self.imageSectionLayout()
            case .name:        return self.nameSectionLayout()
            case .description: return self.descriptionSectionLayout()
            case .teacher:     return self.teacherSectionLayout()
            }
        }
        return departmentLayout
    }
    
    /// 学科の画像のレイアウト
    /// - Returns: 学科の画像のレイアウト
    private func imageSectionLayout() -> NSCollectionLayoutSection {
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
    
    /// 学科の名前のレイアウト
    /// - Returns: 学科の名前のレイアウト
    private func nameSectionLayout() -> NSCollectionLayoutSection {
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
    
    /// 学科の説明のレイアウト
    /// - Returns: 学科の説明のレイアウト
    private func descriptionSectionLayout() -> NSCollectionLayoutSection {
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
    
    /// 先生のレイアウト
    /// - Returns: 先生のレイアウト
    private func teacherSectionLayout() -> NSCollectionLayoutSection {
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
    
}


// MARK: - UICollectionViewDataSource
extension DepartmentViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DepartmentLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let departmentLayoutKind = DepartmentLayoutKind.allCases[section]
        switch departmentLayoutKind {
        case .image:       return 1
        case .name:        return 1
        case .description: return 1
        case .teacher:     return department.teachers?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let departmentLayoutKind = DepartmentLayoutKind.allCases[indexPath.section]
        switch departmentLayoutKind {
        case .image:
            let imageCell = collectionView.dequeueReusableCell(DepartmentImageCell.self, for: indexPath)
            imageCell.initialize(color: department.color, imageName: department.imageName)
            imageCell.delegate = self
            return imageCell
        case .name:
            let nameCell = collectionView.dequeueReusableCell(DepartmentNameCell.self, for: indexPath)
            nameCell.initialize(name: department.name)
            return nameCell
        case .description:
            let descriptionCell = collectionView.dequeueReusableCell(DepartmentDescriptionCell.self, for: indexPath)
            descriptionCell.initialize(description: department.description)
            return descriptionCell
        case .teacher:
            let teacherCell = collectionView.dequeueReusableCell(TeacherCell.self, for: indexPath)
            teacherCell.initialize(name: department.teachers?[indexPath.item].name)
            return teacherCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentLayoutKind = DepartmentLayoutKind.allCases[indexPath.section]
        if departmentLayoutKind == .description {
            let descriptionSectionHeader = collectionView.dequeueReusableView(DepartmentSectionHeader.self, for: indexPath)
            descriptionSectionHeader.initialize(sectionName: "学科説明")
            return descriptionSectionHeader
        } else {
            let teacherSectionHeader = collectionView.dequeueReusableView(DepartmentSectionHeader.self, for: indexPath)
            teacherSectionHeader.initialize(sectionName: "先生")
            return teacherSectionHeader
        }
    }
    
}


// MARK: - DepartmentImageCellDelegate
extension DepartmentViewController: DepartmentImageCellDelegate {
    
    /// 前の画面に戻る
    func back() {
        navigationController?.popViewController(animated: true)
    }

}
