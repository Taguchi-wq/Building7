//
//  DepartmentSectionHeader.swift
//  Building7
//
//  Created by cmStudent on 2021/08/04.
//

import UIKit

class DepartmentSectionHeader: UICollectionReusableView {

    // MARK: - @IBOutlets
    /// セクション名を表示するUILabel
    @IBOutlet private weak var sectionNameLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Initializer
    func initialize(sectionName: String) {
        sectionNameLabel.text = sectionName
    }
    
}
