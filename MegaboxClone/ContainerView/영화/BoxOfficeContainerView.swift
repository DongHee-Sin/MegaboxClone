//
//  boxOfficeContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//


import UIKit

class BoxOfficeContainerView: MainContainerVC {
    
    @IBOutlet weak var boxOfficeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 설정
        boxOfficeCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        boxOfficeCollectionView.delegate = self
        boxOfficeCollectionView.dataSource = self
        boxOfficeCollectionView.register(UINib(nibName: "MovieListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCollectionViewCell")
        boxOfficeCollectionView.collectionViewLayout = createCompositionalLayout()
    }
}


extension BoxOfficeContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieRequest.apiData?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListCollectionViewCell", for: indexPath) as? MovieListCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.updateCell(MovieRequest.apiData?[0] ?? "")
        if let data = MovieRequest.apiData?[indexPath.row] {
            cell.updateCell(data)
        }
        if let data = SearchRequest.imageString[MovieRequest.apiData?[indexPath.row].movieNm ?? ""] {
            cell.addImage(data)
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movieVC = storyboard?.instantiateViewController(withIdentifier: "MovieInfoViewController") as? MovieInfoViewController else {
            return
        }
        
        let data = MovieRequest.apiData?[indexPath.row]
        let movieTitle: String = data!.movieNm
        
        movieVC.loadView()
        
        movieVC.updateUI(url: SearchRequest.imageString[movieTitle]!,
                         title: movieTitle,
                         enTitle: SearchRequest.englishTitle[movieTitle]!,
                         rank: data!.rnum,
                         ratingP: SearchRequest.ratingPoint[movieTitle]!,
                         openDT: data!.openDt,
                         director: SearchRequest.directorName[movieTitle]!,
                         actor: SearchRequest.actors[movieTitle]!,
                         accAu: data!.audiAcc,
                         dyAu: data!.audiCnt,
                         auCh: data!.audiChange)
        
        
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
}
