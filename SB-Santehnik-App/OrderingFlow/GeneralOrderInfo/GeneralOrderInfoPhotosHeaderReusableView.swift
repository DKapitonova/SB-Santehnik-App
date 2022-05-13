//
//  GeneralOrderInfoPhotosHeaderReusableView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoPhotosHeaderReusableView: UICollectionReusableView {
  
  static let kind = "\(id).kind"
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoPhotosHeaderReusableView.self))"
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    $0.text = "Фотографии"
    return $0
  }(UILabel(frame: .zero))

  let countLabel: UILabel  = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .secondaryLabel
    $0.font = .monospacedSystemFont(forTextStyle: .body, weight: .regular)
    return $0
  }(UILabel(frame: .zero))
  
  func configure(withCount count: Int, limitedBy limit: Int) {
    precondition(count <= limit)
    countLabel.text = "\(count)/\(limit)"
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

extension GeneralOrderInfoPhotosHeaderReusableView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(countLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      
      countLabel.firstBaselineAnchor.constraint(equalTo: titleLabel.firstBaselineAnchor),
      countLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5.0),
      trailingAnchor.constraint(greaterThanOrEqualTo: countLabel.trailingAnchor),
    ])
  }
}
