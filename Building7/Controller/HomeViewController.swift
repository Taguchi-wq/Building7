//
//  HomeViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/07/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    /// 学科を表示するUICollectionView
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView(homeCollectionView)
    }
    
    
    // MARK: - Private Funcs
    /// NavigationBarの設定をする
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden           = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton                         = true
    }
    
    /// UICollectionViewの設定をする
    /// - Parameter collectionView: 設定するUICollectionView
    private func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource           = self
        collectionView.collectionViewLayout = createHomeLayout()
        collectionView.registerCell(type: DepartmentCell.self)
        collectionView.registerReusableView(type: DepartmentHeder.self)
    }
    
}


// MARK: - Layout
extension HomeViewController {
    
    // MARK: - Enums
    /// フロアのセクション
    private enum FloorsLayoutKind: CaseIterable {
        case floor10, floor9, floor8, floor7, floor6, floor5, floor4, floor3, floor2, floor1, floorB1, floorB2
    }
    
    
    // MARK: - Private Funcs
    /// ホーム画面のレイアウトを作成
    /// - Returns: ホーム画面のレイアウト
    private func createHomeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section = FloorsLayoutKind.allCases[sectionIndex]
            switch section {
            case .floor10: return self.floorSectionLayout()
            case .floor9:  return self.floorSectionLayout()
            case .floor8:  return self.floorSectionLayout()
            case .floor7:  return self.floorSectionLayout()
            case .floor6:  return self.floorSectionLayout()
            case .floor5:  return self.floorSectionLayout()
            case .floor4:  return self.floorSectionLayout()
            case .floor3:  return self.floorSectionLayout()
            case .floor2:  return self.floorSectionLayout()
            case .floor1:  return self.floorSectionLayout()
            case .floorB1: return self.floorSectionLayout()
            case .floorB2: return self.floorSectionLayout()
            }
        }
        return layout
    }
    
    /// フロアのセクション
    /// - Returns: フロアのセクション
    private func floorSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(3/5),
                                               heightDimension: .fractionalHeight(1/4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(40))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 16, leading: 20, bottom: 16, trailing: 20)
        return section
    }
    
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FloorsLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let departmentCell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentCell.reuseIdentifier, for: indexPath) as! DepartmentCell
        return departmentCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentHeder = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DepartmentHeder.reuseIdentifier, for: indexPath) as! DepartmentHeder
        return departmentHeder
    }
    
}
