//
//  LoginViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: MainViewController {
    
    // 내정보 VC
    var userInfoViewController: UserInfoViewController?
    
    
    // dismiss 버튼
    @IBAction func didTouchedXButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 카카오 소셜로그인 버튼
    @IBAction func didTouchedKakaoLoginButton(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
             print(error)
           }
           else {
            print("loginWithKakaoAccount() success.")
            
            //do something
            _ = oauthToken
            
               let accessToken = oauthToken?.accessToken
               self.setUserInfo()
               
               print("왜 히든처리 안함?")
               if let uesrInfoVC = self.userInfoViewController {
                   uesrInfoVC.beforeLoginContainerView.isHidden = true
                   uesrInfoVC.afterLoginContainerView.isHidden = false
               }
               
               self.dismiss(animated: false, completion: nil)
           }
        }
    }

    func setUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }else {
                print("me() success.")
                
                _ = user
                // do something
                if let nickName = user?.kakaoAccount?.profile?.nickname {
                    self.userNickName = nickName
                }
                self.isUserLogin = true
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
