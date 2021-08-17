//
//  TeacherCell.swift
//  Building7
//
//  Created by cmStudent on 2021/08/03.
//

import UIKit

class TeacherCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    /// 先生の画像を表示するUIImageView
    @IBOutlet weak var teacherImageView: UIImageView!
    /// 先生の名前を表示するUILabel
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    
    // MARK: - Override Funcs
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    // MARK: - Initializer
    func initialize(name: String?) {
        teacherNameLabel.text = name
    }
    
}
