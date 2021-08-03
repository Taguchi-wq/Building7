//
//  DepartmentCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/02.
//

import UIKit

class DepartmentCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// コンテンツビュー
    @IBOutlet private weak var contentsView: UIView!
    /// 学科名を表示するUILabel
    @IBOutlet private weak var departmentNameLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    
    // MARK: - Private Funcs
    /// UIの設定をする
    private func setupUI() {
        layer.cornerRadius = 10
    }

}
