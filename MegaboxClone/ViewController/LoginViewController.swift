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
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카톡이 있을 경우 이쪽 코드가 호출
            UserApi.shared.loginWithKakaoTalk { (OAuthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    _ = OAuthToken
                    
                    // 사용자 닉네임을 가져오면 동작할 내용 작성
                    self.setUserInfo()
                    
                    // 로그인 상태 : true
                    MainViewController.isUserLogin = true
                    
                    self.navigationController?.popViewController(animated: false)
                }
            }
        }
        // 카톡이 없을 경우 else 구문 호출
        else {
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
                    
                    
                    // 로그인된 유저 정보 가져오기
                    let loginUserInfo: UserInfo = self!.userModel.getUserInfo(MainViewController.userNickName)
                    
                    
                    // VC 3번 넘겨서 오기
                    self!.userInfoViewController?.afterVC?.userInfoLabel.text = "\(loginUserInfo.userName)님은 \(loginUserInfo.rating.rawValue)입니다."
                    self!.userInfoViewController?.afterVC?.userPointLabel.text = self!.DecimalPoint(value: loginUserInfo.point)
                }
                
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
