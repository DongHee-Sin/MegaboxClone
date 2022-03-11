//
//  DetailInfoViewController.swift
//  MegaboxClone
//
//  Created by 신동희 on 2022/03/11.
//

import UIKit

class DetailInfoViewController: MainViewController {
    
    // UI 연결
    @IBAction func didTouchedPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var toRadiusView: UIView!
    
    // 업데이트할 UI
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRadiusToUIView(toRadiusView, radiusSize: 20)
        
        userNickName.text = "\(MainViewController.userNickName)님"
        pointLabel.text = DecimalPoint(value: userModel.getUserInfo(1).point)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}

