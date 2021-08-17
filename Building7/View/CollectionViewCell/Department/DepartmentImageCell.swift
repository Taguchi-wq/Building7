//
//  DepartmentImageCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class DepartmentImageCell: UICollectionViewCell {
    
    // MARK: - @IBOutlets
    /// 背景のUIView
    @IBOutlet private weak var backView: UIView!
    /// 学科の画像を表示するUIImageView
    @IBOutlet private weak var departmentImageView: UIImageView!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Initializer
    func initialize(color: String?, imageName: String?) {
        let imageName = imageName ?? ""
        backView.backgroundColor = UIColor(colorCode: color)
        departmentImageView.image = UIImage(named: imageName)
    }
    
}
