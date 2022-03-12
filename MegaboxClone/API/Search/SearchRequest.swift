//
//  SearchRequest.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit
import Alamofire

class SearchRequest {
    
    // 이미지 URL 정보
    static var imageString: [String: String] = [:]
    
    // 영문 title
    static var englishTitle: [String: String] = [:]
    
    // 평점
    static var ratingPoint: [String: String] = [:]
    
    // 감독
    static var directorName: [String: String] = [:]
    
    // 출연배우
    static var actors: [String: String] = [:]
    
    
    func getMovieData(movieTitles: [String], completion: @escaping()-> ()) {
        
        DispatchQueue.global().async {
            for eachTitle in movieTitles {
                // 한글로 검색할 경우 URL Encoding이 필수 (단순 String으로 URL을 찍으면 검색이 되지 않는다!!!!!!)
                let encodedMovieTitle = eachTitle.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
                
                
                let url = "https://openapi.naver.com/v1/search/movie.json?query=\(encodedMovieTitle!)&display=1&start=1"
                
                let params: Parameters = [
                    "query": movieTitles,
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
                            // URL(이미지) 정보 저장
                            SearchRequest.imageString[eachTitle] = response.items[0].image
                            
                            // 영문 title 저장
                            SearchRequest.englishTitle[eachTitle] = response.items[0].subtitle
                            
                            // 평점 저장
                            SearchRequest.ratingPoint[eachTitle] = response.items[0].userRating
                            
                            // 감독과 출연배우
                            SearchRequest.directorName[eachTitle] = response.items[0].director
                            SearchRequest.actors[eachTitle] = response.items[0].actor
                            
                            
                            
                        case .failure(let error):
                            print("검색 실패: \(error.localizedDescription)")
                        }
                    }
            }
        }
        
        // 여기에 이스케이프 클로저 쓰기
        completion()
    }
}
