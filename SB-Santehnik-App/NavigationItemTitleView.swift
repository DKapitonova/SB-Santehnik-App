//
//  NavigationItemTitleView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class NavigationItemTitleView: UIView {
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .headline)
    $0.textColor = .label
    return $0
  }(UILabel(frame: .zero))
  
  let subtitleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .caption1)
    $0.textColor = .secondaryLabel
    $0.textAlignment = .center
    return $0
  }(UILabel(frame: .zero))
  
  func configureWith(title: String, subtitle: String) {
    titleLabel.text = title
    subtitleLabel.text = subtitle
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

extension NavigationItemTitleView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
      bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
    ])
  }
}
