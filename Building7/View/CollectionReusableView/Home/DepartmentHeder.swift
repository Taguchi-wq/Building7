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
    /// トイレの画像を表示するUIImageView
    @IBOutlet private weak var restroomImageView: UIImageView!
    /// 現在いる階数に表示するUILabel
    @IBOutlet private weak var currentLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCurrentLabel(currentLabel)
    }
    
    
    // MARK: - Initializer
    func initialize(floor: Floor, isHidden: Bool) {
        let restroomKind = RestroomKind(rawValue: floor.restroomKind) ?? .menAndWomen
        floorNameLabel.text     = "\(floor.name)F"
        restroomImageView.image = UIImage(named: restroomKind.imageName)
        currentLabel.isHidden   = isHidden
    }
    
    private func setupCurrentLabel(_ label: UILabel) {
        label.layer.cornerRadius = 10
        label.clipsToBounds      = true
    }
    
}
