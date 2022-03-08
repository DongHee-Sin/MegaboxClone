//
//  MovieListCollectionViewCell.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var backgroundUIView: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var reservationButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        
        // 버튼 설정
        reservationButton.layer.cornerRadius = 10
    }
    
    
    // 셀 정보 업데이트
    func updateCell(_ data: dailyBoxOfficeList) {
        titleLabel.text = data.movieNm
        movieInfo.text = "누적관객수 \(data.audiAcc)명"
    }
    
    
    
    
    
    // 셀 그림자+둥글게 설정 (안먹히네)
    func setupLayout() {
        backgroundUIView.layer.borderColor = UIColor.darkGray.cgColor
        backgroundUIView.layer.borderWidth = 1
        backgroundUIView.layer.shadowColor = UIColor.black.cgColor
        backgroundUIView.layer.shadowOpacity = 0.5
        backgroundUIView.layer.shadowRadius = 10
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = 10
        layer.masksToBounds = false
        
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

}
