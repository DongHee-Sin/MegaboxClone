//
//  StoreCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/10.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // Cell Update
    func cellUpdate(_ imageString: String) {
        imageView.image = UIImage(named: imageString)
    }
}
