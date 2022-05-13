//
//  GeneralOrderInfoTaskDescriptionHeaderReusableView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoTaskDescriptionHeaderReusableView: UICollectionReusableView {
  
  static let kind = "\(id).kind"
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoTaskDescriptionHeaderReusableView.self))"
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    $0.text = "Опишите задачу"
    return $0
  }(UILabel(frame: .zero))

  let dotView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemRed
    $0.layer.cornerCurve = .circular
    return $0
  }(UIView(frame: .zero))
  
  override func layoutSubviews() {
    super.layoutSubviews()
    dotView.layer.cornerRadius = dotView.bounds.height / 2.0
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

extension GeneralOrderInfoTaskDescriptionHeaderReusableView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(dotView)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
      bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      
      dotView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
      dotView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5.0),
      dotView.widthAnchor.constraint(equalTo: dotView.heightAnchor),
      dotView.heightAnchor.constraint(equalToConstant: 5.0),
    ])
  }
}
