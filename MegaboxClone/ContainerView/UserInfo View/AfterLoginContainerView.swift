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
    
    @IBOutlet weak var borderView1: UIView!
    @IBOutlet weak var borderView2: UIView!
    
    @IBOutlet weak var pointUIView: UIView!
    
    
    
    // 사용자 이름과 등급을 나타내는 text
//    var userNickName: String? {
//        didSet {
//            userInfoLabel.text = userNickName!
//        }
//    }
    
    // textLabel을 변경하는 함수
    func updateLabel(_ nickName: String) {
        self.userInfoLabel.text = nickName
    }
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIView 세팅
        addBorderRadiusToUIView(radiusView1, radiusSize: radiusView1.frame.height / 3.5, borderColor: UIColor.white.cgColor)
        addBorderRadiusToUIView(radiusView2, radiusSize: radiusView2.frame.height / 3.5, borderColor: UIColor.white.cgColor)
        addBorderRadiusToUIView(borderView1, radiusSize: 0, borderColor: UIColor.lightGray.cgColor)
        addBorderRadiusToUIView(borderView2, radiusSize: 0, borderColor: UIColor.lightGray.cgColor)
        addBorderRadiusToUIView(pointUIView, radiusSize: 5, borderColor: UIColor.systemGray6.cgColor)
        
    }
}
