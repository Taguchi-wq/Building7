//
//  DepartmentHeder.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentHeder: UICollectionReusableView {

    // MARK: - @IBOutlets
    /// フロア名を表示するUILabel
    @IBOutlet private weak var floorNameLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Initializer
    func initialize(floorName: String) {
        floorNameLabel.text = "\(floorName)F"
    }
    
}
