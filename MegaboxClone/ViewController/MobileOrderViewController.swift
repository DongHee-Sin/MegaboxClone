//
//  MobileOrderViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/11.
//

import UIKit

class MobileOrderViewController: MainViewController {
    
    // UI 연결
    @IBOutlet weak var forRadius1: UIView!
    @IBOutlet weak var forRadius2: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Radius 설정
        addRadiusToUIView(forRadius1, radiusSize: 10)
        addRadiusToUIView(forRadius2, radiusSize: 10)
    }
}
