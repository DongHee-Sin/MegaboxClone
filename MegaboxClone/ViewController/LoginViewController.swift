//
//  LoginViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    // dismiss 버튼
    @IBAction func didTouchedXButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 카카오 소셜로그인 버튼
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
