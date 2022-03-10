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
        
        
        // 하위 컨테이너뷰에 self 할당
        guard let containerVC = storyboard?.instantiateViewController(withIdentifier: "BeforeLoginContainerView") as? BeforeLoginContainerView else {
            return
        }
        containerVC.userInfoViewController = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 사용자의 로그인 여부에 따라 다른 ContainerView 보여주기
        if isUserLogin {
            beforeLoginContainerView.isHidden = true
            afterLoginContainerView.isHidden = false
        }else {
            beforeLoginContainerView.isHidden = false
            afterLoginContainerView.isHidden = true
        }
    }
}
