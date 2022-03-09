//
//  MegaPickContainerView.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/09.
//

import UIKit

class MegaPickContainerView: MainContainerVC {
    
    // UI 연결
    @IBOutlet weak var megaPickCollectionView: UICollectionView!
    
    // Model 연결
    var megaPickModel: MegaPickPosterList = MegaPickPosterList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 설정
        megaPickCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        megaPickCollectionView.delegate = self
        megaPickCollectionView.dataSource = self
        megaPickCollectionView.register(UINib(nibName: "EventListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventListCollectionViewCell")
        megaPickCollectionView.collectionViewLayout = createCompositionalLayout2()
    }
}


extension MegaPickContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        megaPickModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventListCollectionViewCell", for: indexPath) as? EventListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(megaPickModel.getPosterImage(indexPath.row))
        
        return cell
    }
    
    
}

