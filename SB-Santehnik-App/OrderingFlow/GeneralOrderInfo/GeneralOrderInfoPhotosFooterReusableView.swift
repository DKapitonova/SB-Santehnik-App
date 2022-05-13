//
//  GeneralOrderInfoPhotosFooterReusableView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoPhotosFooterReusableView: UICollectionReusableView {
  
  static let kind = "\(id).kind"
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoPhotosFooterReusableView.self))"
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .secondaryLabel
    $0.font = .preferredFont(forTextStyle: .body)
    $0.numberOfLines = 0
    $0.text = "Фото нужны для более точной предварительной оценки стоимости"
    return $0
  }(UILabel(frame: .zero))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension GeneralOrderInfoPhotosFooterReusableView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
      bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
    ])
  }
}
