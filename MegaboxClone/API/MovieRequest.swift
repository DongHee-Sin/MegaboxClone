//
//  MovieRequest.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import UIKit
import Alamofire

class MovieRequest {
    
    static var apiData: [dailyBoxOfficeList]?
    
    func getMovieData() {
        print(#function)
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=b4d2c860bdd937f0186339b3082437a1&targetDt=20220301"
        
        let params: Parameters = [
            "key": "b4d2c860bdd937f0186339b3082437a1",
            "targetDt": 20220301
        ]
        
        // 세마포어
//        let semaphore = DispatchSemaphore(value: 0)
        
        // HTTP Method: Get
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: MovieResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("박스오피스 정보 가져오기 성공")
                    MovieRequest.apiData = response.boxOfficeResult.dailyBoxOfficeList
                    
//                    semaphore.signal()
                
                case .failure(let error):
                    print("실패 = \(error.localizedDescription)")
                }
            }
        
    }
}
