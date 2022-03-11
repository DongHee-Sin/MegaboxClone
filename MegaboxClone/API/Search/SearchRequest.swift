//
//  SearchRequest.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit
import Alamofire

class SearchRequest {
    
    static var imageString: [String: String] = [:]
    
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
                            // SearchRequest.imageString 배열에 포스터 이미지 값이 순서대로 저장되지 않는 오류 발생
                            // request time out 에러는 단순 네트워크 오류인듯 -> 시간 지나고 다시 시도하니 잘 작동
//                            if (SearchRequest.imageString?.append(response.items[0].image)) == nil {
//                                SearchRequest.imageString = [response.items[0].image]
//                            }
                            SearchRequest.imageString[eachTitle] = response.items[0].image
                            
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
