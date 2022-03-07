//
//  EventCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(_ imageString: String) {
        eventImage.image = UIImage(named: imageString)
    }
}
