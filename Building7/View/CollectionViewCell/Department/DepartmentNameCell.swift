//
//  DepartmentNameCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentNameCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// 学科名を表示するUILabel
    @IBOutlet private weak var departmentNameLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Initializer
    func initialize(name: String?) {
        departmentNameLabel.text = name
    }

}
