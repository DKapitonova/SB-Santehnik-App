//
//  ProcessedOrderViewController.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

// MARK: -
final class ProcessedOrderViewController: UIViewController {
  
  private(set) lazy var settedView = view as! ProcessedOrderView
  
  override func loadView() {
    view = ProcessedOrderView(frame: .zero)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settedView.configureWith(id: Int.random(in: 10_000...15_000), service: title!, date: "06.12.2021 в 11:30")
  }
  
  init(title: String) {
    super.init(nibName: nil, bundle: nil)
    self.title = title
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}
