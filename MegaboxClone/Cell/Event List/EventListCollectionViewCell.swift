//
//  EventListCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class EventListCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var posterImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ imageString: String) {
        posterImage.image = UIImage(named: imageString)
    }
}
