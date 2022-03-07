//
//  MovieRequest.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import Foundation
import Alamofire

class MovieRequest {
    func getMovieData(_ viewController: ViewController) {
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=b4d2c860bdd937f0186339b3082437a1&targetDt=20220301"
        
        let params: Parameters = [
            "key": "b4d2c860bdd937f0186339b3082437a1",
            "targetDt": 20220301
        ]
        
        // HTTP Method: Get
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseDecodable(of: MovieResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("박스오피스 정보 가져오기 성공")
                    viewController.boxOfficeData = response.boxOfficeResult.dailyBoxOfficeList
                
                case .failure(let error):
                    print("실패 = \(error.localizedDescription)")
                }
            }
        
    }
}
