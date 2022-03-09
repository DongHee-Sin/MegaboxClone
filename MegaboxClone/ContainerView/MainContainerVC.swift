//
//  MainContainerVC.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/08.
//

import UIKit

class MainContainerVC: UIViewController {
    func createCompositionalLayout() -> UICollectionViewLayout {
            
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
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
                
            // 그룹 사이즈
            let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(10/12))
                
            // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
            let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 2)
                
            // 그룹간의 간격 설정
            //groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: groub)
                
            // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
            section.orthogonalScrollingBehavior = .continuous
                
            // 섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
                
            return section
        }
            
        return layout
    }
}
