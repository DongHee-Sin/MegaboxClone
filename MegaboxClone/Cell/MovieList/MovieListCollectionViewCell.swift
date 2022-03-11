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
        

        backgroundUIView.layer.cornerRadius = 10
        addShadow(backgroundUIView, color: UIColor.black.cgColor, width: 0.5, height: 1, alpha: 0.1, radius: 5)
        
        addRadiusToUIViewTop(posterImage, radiusSize: 10)
        
        // 버튼 설정
        reservationButton.layer.cornerRadius = 10
    }
    
    
    // 셀 정보 업데이트
    func updateCell(_ data: dailyBoxOfficeList) {
        titleLabel.text = data.movieNm
        movieInfo.text = "누적관객수 \(data.audiAcc)명"
    }
    
    func addImage(_ imageString: String) {
        DispatchQueue.global().async {
            let url = URL(string: imageString)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async { [weak self] in
                self!.posterImage.image = UIImage(data: data!)
            }
        }
    }
    
    
    
    
    
    // 그림자 넣기
    func addShadow(_ to: UIView, color: CGColor, width: CGFloat, height: CGFloat, alpha: Float, radius: CGFloat) {
            to.layer.shadowColor = color
            to.layer.shadowOpacity = alpha
            to.layer.shadowRadius = radius
            to.layer.shadowOffset = CGSize(width: width, height: height)
            to.layer.shadowPath = nil
    }
    
    // 위에만 둥글게
    func addRadiusToUIViewTop(_ view: UIView, radiusSize: CGFloat) {
        view.layer.cornerRadius = radiusSize
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
