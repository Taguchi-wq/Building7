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
    /// 現在の階数
    private var currentFloor: Int?
    /// 7号館
    private var building = Building()
    
    
    // MARK: - @IBOutlets
    /// 学科を表示するUICollectionView
    @IBOutlet private weak var homeCollectionView: UICollectionView!
    
    
    // MARK: - Override Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCurrentFloor()
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
        collectionView.refreshControl       = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(loadCurrentFloor), for: .valueChanged)
        collectionView.registerCell(DepartmentCell.self)
        collectionView.registerReusableView(DepartmentHeder.self)
    }
    
    /// 学科画面に遷移する
    private func presentDepartmentViewController(department: Department) {
        // 学科がない教室には遷移できないようにする
        guard department.name != nil else { return }
        guard let departmentVC = storyboard?.instantiateViewController(withIdentifier: DepartmentViewController.reuseIdentifier) as? DepartmentViewController else { return }
        departmentVC.initialize(department: department)
        navigationController?.pushViewController(departmentVC, animated: true)
    }
    
}


// MARK: - API通信
extension HomeViewController {
    
    // MARK: - Private Funcs
    /// フロア情報を画面に表示する
    private func updateUI() {
        NetworkManager.shared.loadFloors { result in
            switch result {
            case .success(let floors):
                self.setupCollectionView(self.homeCollectionView)
                self.floors.append(contentsOf: floors)
                self.homeCollectionView.reloadData()
            case .failure(let error):
                Alert.presentInvalidData(on: self, title: error)
            }
        }
    }
    
    /// 現在の階数を表示する
    /// - Parameter currentFloor: 現在の階数
    private func updateCurrentFloor(_ currentFloor: Int) {
        DispatchQueue.main.async {
            self.currentFloor = currentFloor
            self.homeCollectionView.reloadData()
            self.homeCollectionView.refreshControl?.endRefreshing()
        }
    }
    
    
    // MARK: - @objc
    /// 現在の階数を読み込む
    @objc private func loadCurrentFloor() {
        DispatchQueue.global().async {
            self.building.getCurrentFloor { result in
                switch result {
                case .success(let currentFloor):
                    self.updateCurrentFloor(currentFloor)
                case .failure(let error):
                    Alert.presentInvalidCurrentFloor(on: self, title: error)
                    self.updateCurrentFloor(0)
                }
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
            heightDimension: .fractionalHeight(1/6)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(45)
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
        
        if currentFloor == (floorsLayoutKind.index + 1) {
            departmentHeder.initialize(floor: floor, isHidden: false)
        } else {
            departmentHeder.initialize(floor: floor, isHidden: true)
        }
        
        return departmentHeder
    }
    
}


// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let floorsLayoutKind = FloorsLayoutKind.allCases[indexPath.section]
        let floor = floors[floorsLayoutKind.index]
        let department = floor.departments[indexPath.item]
        presentDepartmentViewController(department: department)
    }
    
}
