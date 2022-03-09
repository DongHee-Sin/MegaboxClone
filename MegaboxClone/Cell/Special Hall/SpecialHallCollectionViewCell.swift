//
//  SpecialHallCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class SpecialHallCollectionViewCell: UICollectionViewCell {
    
    // UI 연결
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ hallInfo: [String]) {
        image.image = UIImage(named: hallInfo[0])
        text.text = hallInfo[1]
    }
}
