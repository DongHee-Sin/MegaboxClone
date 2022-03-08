//
//  SearchRequest.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit
import Alamofire

class SearchRequest {
    
    static var apiData: item?
    
    func getMovieData(movieTitle: String, completion: @escaping()-> ()) {
        
        // 한글로 검색할 경우 URL Encoding이 필수 (단순 String으로 URL을 찍으면 검색이 되지 않는다!!!!!!)
        let encodedMovieTitle = movieTitle.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        
        let url = "https://openapi.naver.com/v1/search/movie.json?query=\(encodedMovieTitle!)&display=1&start=1"
        
        let params: Parameters = [
            "query": movieTitle,
            "display": 1,
            "start": 1
        ]
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "URkQFjmEqT0z8FFYCJxa",
            "X-Naver-Client-Secret": "PmtdcnQa43"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: headers)
            .responseDecodable(of: SearchResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("검색 성공: \(response)")
                    
                case .failure(let error):
                    print("검색 실패: \(error.localizedDescription)")
                }
            }
    }
}
