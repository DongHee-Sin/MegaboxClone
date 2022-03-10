//
//  StoreViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/10.
//

import UIKit

class StoreViewController: MainViewController {
    
    // UI 연결
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    
    // Model 연결
    var productModel: ProductModel = ProductModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 설정
        storeCollectionView.delegate = self
        storeCollectionView.dataSource = self
        storeCollectionView.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreCollectionViewCell")
        storeCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
    }
}



extension StoreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as? StoreCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    // 컬렉션뷰 헤더 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = storeCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath)
            return header
        }else {
            return UICollectionReusableView()
        }
    }
}

