//
//  MovieContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit


class MovieContainerView: MainContainerVC {
    
    // UI 연결
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // Model 연결
    var moviePosterModel: MoviePosterList = MoviePosterList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 설정
        movieCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(UINib(nibName: "EventListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventListCollectionViewCell")
        movieCollectionView.collectionViewLayout = createCompositionalLayout2()
    }
}


extension MovieContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviePosterModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventListCollectionViewCell", for: indexPath) as? EventListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(moviePosterModel.getPosterImage(indexPath.row))
        
        return cell
    }
    
    
}
