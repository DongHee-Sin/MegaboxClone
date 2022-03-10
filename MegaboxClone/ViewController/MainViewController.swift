//
//  MainViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/10.
//

import UIKit


class MainViewController: UIViewController {
    
    // 사용자 정보
    static var isUserLogin: Bool = false
    static var userNickName: String = "사용자"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // UI 함수
    func addBorderRadiusToUIView(_ view: UIView, radiusSize: CGFloat, borderColor: CGColor) {
        view.layer.cornerRadius = radiusSize
        view.layer.borderColor = borderColor
        view.layer.borderWidth = 1
    }
}
