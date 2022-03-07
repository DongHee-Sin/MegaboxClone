//
//  MovieAPI.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import Foundation

struct MovieResponse: Decodable {
    var boxOfficeResult: boxOfficeResult
}


struct boxOfficeResult: Decodable {
    var boxofficeType: String
    var showRange: String
    var dailyBoxOfficeList: [dailyBoxOfficeList]
}


struct dailyBoxOfficeList: Decodable {
    var rnum: String
    var rank: String
    var rankInten: String
    var rankOldAndNew: String
    var movieCd: String
    var movieNm: String
    var openDt: String
    var salesAmt: String
    var salesShare: String
    var salesInten: String
    var salesChange: String
    var salesAcc: String
    var audiCnt: String
    var audiInten: String
    var audiChange: String
    var audiAcc: String
    var scrnCnt: String
    var showCnt: String
}
