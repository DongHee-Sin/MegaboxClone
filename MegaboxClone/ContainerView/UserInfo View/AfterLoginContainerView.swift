//
//  AfterLoginContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class AfterLoginContainerView: MainViewController {
    
    // UI 연결
    @IBOutlet weak var radiusView1: UIView!
    @IBOutlet weak var radiusView2: UIView!
    
    // 사용자 이름과 등급을 나타내는 text
    @IBOutlet weak var userRatingLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIView 세팅
        addBorderRadiusToUIView(radiusView1, radiusSize: radiusView1.frame.height / 3.5, borderColor: UIColor.white.cgColor)
        addBorderRadiusToUIView(radiusView2, radiusSize: radiusView2.frame.height / 3.5, borderColor: UIColor.white.cgColor)
    }
}
