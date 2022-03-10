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
    
    
    // 컨테이너 뷰 참조 얻은 변수
    var beforeVC: BeforeLoginContainerView?
    var afterVC: AfterLoginContainerView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        beforeVC?.userInfoVC = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 사용자의 로그인 여부에 따라 다른 ContainerView 보여주기
        if MainViewController.isUserLogin {
            beforeLoginContainerView.isHidden = true
        }
    }
    
    
    
    // 컨테이너뷰 참조 얻기
    // beforeSegue
    // afterSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let beforeVC as BeforeLoginContainerView:
            self.beforeVC = beforeVC
            
        case let afterVC as AfterLoginContainerView:
            self.afterVC = afterVC
            
        default:
            break
        }
    }
}
