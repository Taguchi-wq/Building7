//
//  DepartmentViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentViewController: UIViewController {

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
        collectionView.registerCell(type: DepartmentImageCell.self)
        collectionView.registerCell(type: DepartmentNameCell.self)
        collectionView.registerCell(type: DepartmentDescriptionCell.self)
        collectionView.registerCell(type: TeacherCell.self)
        collectionView.registerReusableView(type: DepartmentSectionHeader.self)
    }

}


// MARK: - Layout
extension DepartmentViewController {
    
    // MARK: - Enums
    /// 学科画面のレイアウトのセクション
    private enum DepartmentLayoutKind: CaseIterable {
        case image, name, description, teacher
    }
    
    
    // MARK: - Private Funcs
    /// 学科画面を作成
    /// - Returns: 学科画面
    private func createDepartmentLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section = DepartmentLayoutKind.allCases[sectionIndex]
            switch section {
            case .image:       return self.imageSectionLayout()
            case .name:        return self.nameSectionLayout()
            case .description: return self.descriptionSectionLayout()
            case .teacher:     return self.teacherSectionLayout()
            }
        }
        return layout
    }
    
    /// 学科の画像のレイアウト
    /// - Returns: 学科の画像のレイアウト
    private func imageSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    /// 学科の名前のレイアウト
    /// - Returns: 学科の名前のレイアウト
    private func nameSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(1/8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 20, leading: 20, bottom: 60, trailing: 20)
        return section
    }
    
    /// 学科の説明のレイアウト
    /// - Returns: 学科の説明のレイアウト
    private func descriptionSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(1/8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(40))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = .init(top: 10, leading: 20, bottom: 60, trailing: 20)
        return section
    }
    
    /// 先生のレイアウト
    /// - Returns: 先生のレイアウト
    private func teacherSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4),
                                               heightDimension: .fractionalHeight(1/7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(40))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 10, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
}


// MARK: - UICollectionViewDataSource
extension DepartmentViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DepartmentLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = DepartmentLayoutKind.allCases[section]
        switch section {
        case .image:
            return 1
        case .name:
            return 1
        case .description:
            return 1
        case .teacher:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = DepartmentLayoutKind.allCases[indexPath.section]
        switch section {
        case .image:
            let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentImageCell.reuseIdentifier, for: indexPath) as! DepartmentImageCell
            return imageCell
        case .name:
            let nameCell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentNameCell.reuseIdentifier, for: indexPath) as! DepartmentNameCell
            return nameCell
        case .description:
            let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentDescriptionCell.reuseIdentifier, for: indexPath) as! DepartmentDescriptionCell
            return descriptionCell
        case .teacher:
            let teacherCell = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherCell.reuseIdentifier, for: indexPath) as! TeacherCell
            return teacherCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = DepartmentLayoutKind.allCases[indexPath.section]
        if section == .description {
            let departmentSectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DepartmentSectionHeader.reuseIdentifier, for: indexPath) as! DepartmentSectionHeader
            departmentSectionHeader.initialize(sectionName: "学科説明")
            return departmentSectionHeader
        } else {
            let departmentSectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DepartmentSectionHeader.reuseIdentifier, for: indexPath) as! DepartmentSectionHeader
            departmentSectionHeader.initialize(sectionName: "先生")
            return departmentSectionHeader
        }
    }
    
}
