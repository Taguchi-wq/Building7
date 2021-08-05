//
//  DepartmentViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentViewController: UIViewController {
    
    // MARK: - Properties
    /// 学科の画像のセクション
    private var imageSection: DepartmentImageSection!
    /// 学科の名前のセクション
    private var nameSection: DepartmentNameSection!
    /// 学科の説明のセクション
    private var descriptionSection: DepartmentDescriptionSection!
    /// 学科の先生のセクション
    private var teacherSection: DepartmentTeacherSection!
    

    // MARK: - @IBOutlets
    /// 学科の詳細を表示するUICollectionView
    @IBOutlet private weak var departmentCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        setupCollectionView(departmentCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    
    // MARK: - Initializer
    private func initialize() {
        imageSection       = DepartmentImageSection(items: 1, delegate: self)
        nameSection        = DepartmentNameSection(items: 1)
        descriptionSection = DepartmentDescriptionSection(items: 1)
        teacherSection     = DepartmentTeacherSection(items: 4)
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
            let departmentLayoutKind = DepartmentLayoutKind.allCases[sectionIndex]
            switch departmentLayoutKind {
            case .image:       return self.imageSection.sectionLayout()
            case .name:        return self.nameSection.sectionLayout()
            case .description: return self.descriptionSection.sectionLayout()
            case .teacher:     return self.teacherSection.sectionLayout()
            }
        }
        return layout
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
        case .image:       return imageSection.numberOfItems
        case .name:        return nameSection.numberOfItems
        case .description: return descriptionSection.numberOfItems
        case .teacher:     return teacherSection.numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let departmentLayoutKind = DepartmentLayoutKind.allCases[indexPath.section]
        switch departmentLayoutKind {
        case .image:       return imageSection.createCell(collectionView, at: indexPath)
        case .name:        return nameSection.createCell(collectionView, at: indexPath)
        case .description: return descriptionSection.createCell(collectionView, at: indexPath)
        case .teacher:     return teacherSection.createCell(collectionView, at: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let departmentLayoutKind = DepartmentLayoutKind.allCases[indexPath.section]
        if departmentLayoutKind == .description {
            return descriptionSection.createHeader(collectionView, at: indexPath)
        } else {
            return teacherSection.createHeader(collectionView, at: indexPath)
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
