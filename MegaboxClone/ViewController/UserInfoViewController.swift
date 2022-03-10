//
//  UserInfoViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class UserInfoViewController: MainViewController {
    
    // 컨테이너 뷰
    @IBOutlet weak var beforeLoginContainerView: UIView!
    @IBOutlet weak var afterLoginContainerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 사용자의 로그인 여부에 따라 다른 ContainerView 보여주기
        if MainViewController.isUserLogin {
            beforeLoginContainerView.isHidden = true
            afterLoginContainerView.isHidden = false
        }else {
            beforeLoginContainerView.isHidden = false
            afterLoginContainerView.isHidden = true
        }
    }
}
