//
//  HashTagCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit

class HashTagCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
    
    // awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                cellIsSelected(true)
            }else {
                cellIsSelected(false)
            }
        }
    }

    
    
    // 초기 셀 업데이트
    func updateCell(_ text: String) {
        textLabel.text = text
    }
    // 셀이 선택되면 실행할 함수
    func cellIsSelected(_ isSelected: Bool) {
        if isSelected == true {
            textLabel.textColor = UIColor.black
            buttonView.isHidden = false
        }else {
            textLabel.textColor = UIColor.lightGray
            buttonView.isHidden = true
        }
    }
    
}
