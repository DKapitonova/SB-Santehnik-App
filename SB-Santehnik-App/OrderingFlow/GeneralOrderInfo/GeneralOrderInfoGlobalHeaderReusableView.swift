//
//  GeneralOrderInfoGlobalHeaderReusableView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoGlobalHeaderReusableView: UICollectionReusableView {
  
  static let kind = "\(id).kind"
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoGlobalHeaderReusableView.self))"
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .title2, weight: .semibold)
    return $0
  }(UILabel(frame: .zero))
  
  func configure(withTitle title: String) {
    titleLabel.text = title
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension GeneralOrderInfoGlobalHeaderReusableView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
      bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
    ])
  }
}
