//
//  DepartmentImageCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentImageCell: UICollectionViewCell {
    
    // MARK: - Properties
    /// デリゲート
    weak var delegate: DepartmentImageCellDelegate?
    
    
    // MARK: - @IBOutlets
    /// 戻るボタン
    @IBOutlet private weak var backButton: UIButton!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupButton(backButton)
    }
    
    
    // MARK: - Private Funcs
    private func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 20
    }

    
    // MARK: - @IBActions
    /// 戻るボタンを押した時の処理
    @IBAction private func tappedBackButton(_ sender: UIButton) {
        delegate?.back()
    }
    
}
