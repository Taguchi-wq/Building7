//
//  DepartmentDescriptionCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentDescriptionCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// 学科の説明を表示するUILabel
    @IBOutlet private weak var departmentDescriptionLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Initializer
    func initialize(description: String?) {
        departmentDescriptionLabel.text = description
    }

}
