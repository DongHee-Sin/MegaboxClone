//
//  ViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import UIKit
import Alamofire
import Tabman
import Pageboy


class ViewController: TabmanViewController {
    
    // MARK: - API 데이터
    var boxOfficeData: [dailyBoxOfficeList]?
    
    
    
    
    
    // MARK: - Model 연결
    var eventListModel: EventList = EventList()
    
    
    
    // MARK: - UI연결
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 설정
        eventCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        eventCollectionView.register(UINib(nibName: "EventCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventCollectionViewCell")
        eventCollectionView.collectionViewLayout = createCompositionalLayout()

        // 박스오피스 정보 가져와서 boxOfficeData 변수에 값을 입력하는 함수
        MovieRequest().getMovieData(self)
    }
    
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
    }
}


// MARK: - API 데이터 받아오기
//extension ViewController {
//    func getMovieData() {
//        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=b4d2c860bdd937f0186339b3082437a1&targetDt=20220301"
//
//        let params: Parameters = [
//            "key": "b4d2c860bdd937f0186339b3082437a1",
//            "targetDt": 20220301
//        ]
//
//        // HTTP Method: Get
//        AF.request(url,
//                   method: .get,
//                   parameters: params,
//                   headers: nil)
//            .responseDecodable(of: MovieResponse.self) { response in
//                switch response.result {
//                case .success(let response):
//                    print("박스오피스 정보 가져오기 성공")
//                    self.boxOfficeData = response.boxOfficeResult.dailyBoxOfficeList
//
//                case .failure(let error):
//                    print("실패 = \(error.localizedDescription)")
//                }
//            }
//
//    }
//}







// MARK: - CollectionView 프로토콜 채택

// 하나의 VC내부에 여러 collectionView가 들어오니까 조건문을 통해 구분 적용
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 이벤트 컬렉션뷰
        if collectionView == eventCollectionView {
            return eventListModel.count
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 이벤트 컬렉션뷰
        if collectionView == eventCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as? EventCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(eventListModel.getEventData(indexPath.row))
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}



// MARK: - 컴포지셔널 컬렉션뷰 레이아웃 잡는 함수 작성
extension ViewController {
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
            
        // 컴포지셔널 레이아웃 생성
        // 생성하면 튜플(key: value, key: value)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
        let layout = UICollectionViewCompositionalLayout {
            // 매개변수와 반환타입 (내부에서 섹션을 구성하고 완성된 섹션을 반환하는 것)
            (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
            // 아이템에 대한 사이즈
            // absolute: 고정값, estimateed: 추측, fraction: 퍼센트(내 화면에서 얼마만큼 설정할건가.. 뭐 그런거)
            // fraction은 상위View를 기준으로 퍼센트 잡는듯 (ex- 아이템은 그룹 사이즈를 기준으로 % 잡는듯)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
            // 위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
            // 아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10)
                
            // 그룹 사이즈
            let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(1/3))
                
            // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
            let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 4)
                
            // 그룹간의 간격 설정
            //groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: groub)
                
            // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
            section.orthogonalScrollingBehavior = .continuous
                
            // 섹션에 대한 간격 설정
//            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
            return section
        }
            
        return layout
    }
}



// MARK: - TapMan 프로토콜 채택
//extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
//
//
//
//}
