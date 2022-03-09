//
//  Model.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import Foundation


// MARK: - 이벤트 리스트 모델
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
