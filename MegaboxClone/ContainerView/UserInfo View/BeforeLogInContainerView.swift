//
//  BeforeLogInContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import Foundation
import UIKit

class BeforeLoginContainerView: MainViewController {
    
    // UserInfo VC
    var userInfoVC: UserInfoViewController?
    
    
    // UI연결
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    // 로그인 버튼 클릭
    @IBAction func didTouchedLoginButton(_ sender: UIButton) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        
        loginVC.userInfoViewController = userInfoVC!
        
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetting(view1)
        viewSetting(view2)
        
    }
    
    
    // view 세팅 함수
    func viewSetting(_ view: UIView) {
        view.layer.cornerRadius = view.frame.height / 3
    }
}
