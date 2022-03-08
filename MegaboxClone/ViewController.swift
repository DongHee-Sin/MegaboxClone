//
//  ViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/07.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    
    
    // api값 넘어왔는지 확인할 버튼
    @IBAction func testButton(_ sender: UIButton) {
        print(MovieRequest.apiData?.count)
    }
    
    
    
    // MARK: - API 데이터 (지울까..)
    var boxOfficeData: [dailyBoxOfficeList]?
    
    
    
    
    
    // MARK: - Model 연결
    var eventListModel: EventList = EventList()
    var hashTagModel: HashTagList = HashTagList()
    
    
    
    // MARK: - UI연결
    
    // 상단 이벤트 컬렉션뷰
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    // 해시태그 컬렉션뷰
    @IBOutlet weak var hashTagCollectionView: UICollectionView!
    
    // 영화 리스트 상단 라운딩 주려고 연결
    @IBOutlet weak var movieListUIView: UIView!
    
    // 컨테이너 뷰
    @IBOutlet weak var boxOfficeContainerView: UIView!
    @IBOutlet weak var comingSoonContainerView: UIView!
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이벤트 컬렉션뷰 설정
        eventCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionViewSetting(eventCollectionView, nib: "EventCollectionViewCell")
        eventCollectionView.collectionViewLayout = createCompositionalLayout()

        // 해시태그 컬렉션뷰 설정
        hashTagCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionViewSetting(hashTagCollectionView, nib: "HashTagCollectionViewCell")
        
        
        
        
        MovieRequest().getMovieData()
        
    }
    
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    // MARK: - 함수들
    func collectionViewSetting(_ collectionView: UICollectionView, nib: String) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: nib, bundle: nil), forCellWithReuseIdentifier: nib)
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
        if collectionView == hashTagCollectionView {
            return hashTagModel.count
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
        if collectionView == hashTagCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HashTagCollectionViewCell", for: indexPath) as? HashTagCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(hashTagModel.getHashTag(indexPath.row))
            if indexPath.row == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    // 셀이 선택되면 컨테이너뷰 isHidden 컨트롤
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)번째 셀 선택되었슴")
        // 여기서 스위치로 0번째가 눌리면 컨테이너뷰 히든 트루펄스 설정해주면 될듯
        if indexPath.row == 0 {
            boxOfficeContainerView.isHidden = false
            comingSoonContainerView.isHidden = true
        }else {
            boxOfficeContainerView.isHidden = true
            comingSoonContainerView.isHidden = false
        }
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



// 에러메시지 겁나 나와서 구글링을 통해 복붙한 코드 (나중에 심심하면 찾아봐야...지)
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 15, height: collectionView.frame.width/9)
    }
}
