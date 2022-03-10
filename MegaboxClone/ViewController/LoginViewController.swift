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
        self.navigationController?.popViewController(animated: false)
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
            
//               let accessToken = oauthToken?.accessToken
               
               // 사용자 닉네임을 가져오면 동작할 내용 작성
               self.setUserInfo()
               
               // 로그인 상태 : true
               MainViewController.isUserLogin = true
               
               self.navigationController?.popViewController(animated: false)
           }
        }
    }

    
    func setUserInfo() {
        UserApi.shared.me() { [weak self] (user, error) in
            if let error = error {
                print(error)
            }else {
                print("me() success.")
                
                _ = user
                // do something
                if let nickName = user?.kakaoAccount?.profile?.nickname {
                    MainViewController.userNickName = nickName
                    print(MainViewController.userNickName)
                    
                    // VC 3번 넘겨서 오기
                    self!.userInfoViewController?.afterVC?.userInfoLabel.text = "\(nickName)님은 일반등급입니다."
                }
                
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
