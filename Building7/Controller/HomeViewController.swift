//
//  HomeViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/07/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    /// フロアのセクション
    private var floorSection: FloorSection!
    
    
    // MARK: - @IBOutlets
    /// 学科を表示するUICollectionView
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        setupCollectionView(homeCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    
    // MARK: - Initializer
    private func initialize() {
        floorSection = FloorSection(items: 12)
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
        collectionView.delegate             = self
        collectionView.collectionViewLayout = createHomeLayout()
        collectionView.registerCell(DepartmentCell.self)
        collectionView.registerReusableView(DepartmentHeder.self)
    }
    
    /// 学科画面に遷移する
    private func presentDepartmentViewController() {
        guard let departmentVC = storyboard?.instantiateViewController(withIdentifier: DepartmentViewController.reuseIdentifier) as? DepartmentViewController else { return }
        navigationController?.pushViewController(departmentVC, animated: true)
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
            let layout = self.floorSection.sectionLayout()
            let floorsLayoutKind = FloorsLayoutKind.allCases[sectionIndex]
            switch floorsLayoutKind {
            case .floor10: return layout
            case .floor9:  return layout
            case .floor8:  return layout
            case .floor7:  return layout
            case .floor6:  return layout
            case .floor5:  return layout
            case .floor4:  return layout
            case .floor3:  return layout
            case .floor2:  return layout
            case .floor1:  return layout
            case .floorB1: return layout
            case .floorB2: return layout
            }
        }
        return layout
    }
    
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FloorsLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return floorSection.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return floorSection.createCell(collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return floorSection.createHeader(collectionView, at: indexPath)
    }
    
}


// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDepartmentViewController()
    }
    
}
