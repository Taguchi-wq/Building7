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
        collectionView.dataSource = self
        collectionView.registerFromNib(type: DepartmentCell.self)
    }
    
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let departmentCell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentCell.reuseIdentifier, for: indexPath) as! DepartmentCell
        return departmentCell
    }
    
}
