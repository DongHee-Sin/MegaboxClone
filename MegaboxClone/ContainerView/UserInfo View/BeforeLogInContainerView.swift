//
//  BeforeLogInContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import Foundation
import UIKit

class BeforeLoginContainerView: UserInfoContainerVC {
    
    // UI연결
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    
    // 
    
    
    @IBAction func didTouchedLoginButton(_ sender: UIButton) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        // 여기서 네비게이션 컨트롤러로 뷰 전환하기
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetting(view1)
        viewSetting(view2)
        
    }
    
    
    // view 세팅 함수
    func viewSetting(_ view: UIView) {
        view.layer.cornerRadius = 10
    }
}
