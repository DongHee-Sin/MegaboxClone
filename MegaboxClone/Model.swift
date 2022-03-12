//
//  Model.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import Foundation


// MARK: - Model

struct EventList {
    private var storage: [String] = []
    
    init() {
        storage = [
            "오티.png", "빵원티켓.png", "오티2.png", "선거인증.png", "VIP.png", "제휴할인.png", "무비피드.png"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getEventData(_ index: Int) -> String {
        return storage[index]
    }
}



struct HashTagList {
    private var storage: [String] = []
    
    init() {
        storage = [
            "#박스오피스", "#상영예정", "#아카데미", "#단독", "#돌비시네마", "#몬스터짐 아레나", "#클로", "#필소"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getHashTag(_ index: Int) -> String {
        return storage[index]
    }
}



struct EventTagList {
    private var storage: [String] = []
    
    init() {
        storage = [
            "메가Pick", "영화", "극장", "제휴/할인", "시사회/무대인사"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getEventTag(_ index: Int) -> String {
        return storage[index]
    }
}




struct MegaPickPosterList {
    private var storage: [String] = []
    
    init() {
        storage = [
            // 이미지 문자열
            "매가 금빛.jpeg", "매가 배트맨.jpeg", "매가 투표.jpeg", "매가 BTS.jpeg"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getPosterImage(_ index: Int) -> String {
        return storage[index]
    }
}




struct MoviePosterList {
    private var storage: [String] = []
    
    init() {
        storage = [
            // 이미지 문자열
            "영화 스펜서.jpeg", "영화 유어러브송.jpeg", "영화 인류멸망.jpeg", "영화 정성일.jpeg"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getPosterImage(_ index: Int) -> String {
        return storage[index]
    }
}




struct SpecialHallList {
    private var imageStorage: [String] = []
    private var textStorage: [String] = []
    
    init() {
        imageStorage = [
            "특별1.png", "특별2.png", "특별3.png", "특별4.png", "특별5.png"
        ]
        
        textStorage = [
            "Dolby Cinema", "THE BOUTIQUE", "MX", "COMFORT", "MEGABOX KIDS"
        ]
    }
    
    var count: Int {
        return imageStorage.count
    }
    
    func getSpecialHallInfo(_ index: Int) -> [String] {
        return [imageStorage[index], textStorage[index]]
    }
}




struct ProductModel {
    private var storage: [String] = []
    
    init() {
        storage = [
            // 이미지 문자열
            "코카콜라굿즈.jpeg", "패밀리패키지.jpeg", "일반티켓.jpeg", "부티크티켓.jpeg", "부티크스위트티켓.jpeg", "돌비티켓.jpeg", "러브콤보.jpeg"
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getProductImage(_ index: Int) -> String {
        return storage[index]
    }
}





struct UserList {
    private var storage: [Int: UserInfo]
    
    var userKey: [String: Int] = [
        "신동희": 1
    ]
    
    init() {
        storage = [
            1: UserInfo(userName: "신동희", point: 1550, rating: .일반)
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func getUserInfo(_ userName: String) -> UserInfo {
        return storage[userKey[userName] ?? 0] ?? UserInfo(userName: "OOO", point: 0, rating: .일반)
    }
}









// MARK: - Data Type

struct UserInfo {
    var userName: String
    var point: Int
    var rating: Rating
}


enum Rating: String {
    case 일반 = "일반등급"
    case VIP = "VIP"
    case VVIP = "VVIP"
}
