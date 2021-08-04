//
//  DepartmentImageCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentImageCell: UICollectionViewCell {
    
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

}
