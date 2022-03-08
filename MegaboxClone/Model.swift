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
