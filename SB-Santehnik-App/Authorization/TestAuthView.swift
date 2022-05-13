//
//  TestAuthView.swift
//  SB-Santehnik-App
//
//  Created by Daria on 30.11.2021.
//

import UIKit
import SnapKit

class TestAuthView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setTitle("Здесь будет авторизация", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc private func buttonClicked(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    //     searchViewController.modalPresentationStyle = .fullScreen
     //     self.present(searchViewController, animated: true, completion: nil)
    }
}
