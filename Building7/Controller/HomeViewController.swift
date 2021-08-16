//
//  HomeViewController.swift
//  Building7
//
//  Created by cmStudent on 2021/07/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    /// 7号館のフロア情報を格納する配列
    private var floors: [Floor] = []
    
    
    // MARK: - @IBOutlets
    /// 学科を表示するUICollectionView
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
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
        collectionView.collectionViewLayout = createFloorLayout()
        collectionView.registerCell(DepartmentCell.self)
        collectionView.registerReusableView(DepartmentHeder.self)
    }
     
    /// 学科画面に遷移する
    private func presentDepartmentViewController() {
        guard let departmentVC = storyboard?.instantiateViewController(withIdentifier: DepartmentViewController.reuseIdentifier) as? DepartmentViewController else { return }
        navigationController?.pushViewController(departmentVC, animated: true)
    }
    
}


// MARK: - API通信
extension HomeViewController {
    
    /// フロア情報を画面に表示する
    private func updateUI() {
        NetworkManager.shared.loadFloors { result in
            self.setupCollectionView(self.homeCollectionView)
            switch result {
            case .success(let floors):
                self.floors.append(contentsOf: floors)
                self.homeCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


// MARK: - Layout
extension HomeViewController {
    
    // MARK: - Private Funcs
    /// ホーム画面のレイアウトを作成
    /// - Returns: ホーム画面のレイアウト
    private func createFloorLayout() -> UICollectionViewLayout {
        let floorLayout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self.floorSectionLayout()
        }
        
        return floorLayout
    }
    
    /// フロアセクションのレイアウト
    /// - Returns: フロアセクションのレイアウト
    private func floorSectionLayout() -> NSCollectionLayoutSection {
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
    
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FloorsLayoutKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let floorsLayoutKind = FloorsLayoutKind.allCases[section]
        let floor = floors[floorsLayoutKind.index]
        return floor.departments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let floorsLayoutKind = FloorsLayoutKind.allCases[indexPath.section]
        let floor = floors[floorsLayoutKind.index]
        let department = floor.departments[indexPath.item]
        
        let departmentCell = collectionView.dequeueReusableCell(DepartmentCell.self, for: indexPath)
        departmentCell.initialize(department: department)
        return departmentCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let floorsLayoutKind = FloorsLayoutKind.allCases[indexPath.section]
        let floor = floors[floorsLayoutKind.index]
        
        let departmentHeder = collectionView.dequeueReusableView(DepartmentHeder.self, for: indexPath)
        departmentHeder.initialize(floorName: floor.name)
        return departmentHeder
    }
    
}


// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDepartmentViewController()
    }
    
}
