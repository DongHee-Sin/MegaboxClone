//
//  UserInfoSingleton.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/12.
//

import Foundation

// API를 통해 유저정보를 받아올 때
// 이 싱글톤 객체에 필요한 값을 할당한 후 필요한 VC에서 사용한다.
class UserInfoSingleton {
    
    // 상수에 자기 자신의 참조를 할당하고 static으로 공유
    static let shared = UserInfoSingleton()
    
    var userName: String?
    var userPoint: Int?
    
    // init함수 접근제어자를 private로 선언하여 instance를 또 생성하는것을 방지
    private init() { }
}



