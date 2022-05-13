//
//  ChooseOrderDateViewController.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateViewController: UIViewController {
  
  private(set) lazy var settedView = view as! ChooseOrderDateView
  override func loadView() {
    view = ChooseOrderDateView(frame: .zero)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let titleView = NavigationItemTitleView(frame: .zero)
    titleView.configureWith(title: self.title!, subtitle: "шаг 3/3")
    //titleView.sizeToFit()
    navigationItem.titleView = titleView
    
    settedView.bottomView.continueButton.addTarget(self, action: #selector(continueButtonDidTapped(_:)), for: .touchUpInside)
  }
  
  @objc private func continueButtonDidTapped(_ sender: UIButton) {
    navigationController?.pushViewController(ProcessedOrderViewController(title: title!), animated: true)
  }
  
  init(title: String) {
    super.init(nibName: nil, bundle: nil)
    self.title = title
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
