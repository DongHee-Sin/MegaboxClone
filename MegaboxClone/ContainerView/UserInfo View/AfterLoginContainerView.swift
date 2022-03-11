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
    
    @IBOutlet weak var radiusView3: UIView!
    
    
    @IBOutlet weak var borderView1: UIView!
    @IBOutlet weak var borderView2: UIView!
    
    @IBOutlet weak var pointUIView: UIView!
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    @IBOutlet weak var userPointLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIView 세팅
        addBorderRadiusToUIView(radiusView1, radiusSize: radiusView1.frame.height / 3.5, borderColor: UIColor.white.cgColor)
        addBorderRadiusToUIView(radiusView2, radiusSize: radiusView2.frame.height / 3.5, borderColor: UIColor.white.cgColor)
        addBorderRadiusToUIView(borderView1, radiusSize: 0, borderColor: UIColor.lightGray.cgColor)
        addBorderRadiusToUIView(borderView2, radiusSize: 0, borderColor: UIColor.lightGray.cgColor)
        addBorderRadiusToUIView(pointUIView, radiusSize: 10, borderColor: UIColor.systemGray6.cgColor)
        addRadiusToUIView(radiusView3, radiusSize: radiusView3.frame.height/2)
        
        
        addShadow(pointUIView, color: UIColor.black.cgColor, width: 2, height: 5, alpha: 0.3, radius: 30)
    }
}
