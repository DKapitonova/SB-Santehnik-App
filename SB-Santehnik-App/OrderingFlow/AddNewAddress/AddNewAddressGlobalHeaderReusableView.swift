//
//  AddNewAddressGlobalHeaderReusableView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class AddNewAddressGlobalHeaderReusableView: UICollectionReusableView {
  
  static let kind = "\(id).kind"
  
  static let id = "\(NSStringFromClass(AddNewAddressGlobalHeaderReusableView.self))"
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .title2, weight: .semibold)
    return $0
  }(UILabel(frame: .zero))
  
  let onMapButton: OutlineBigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "На карте ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "mappin.and.ellipse")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    return $0
  }(OutlineBigButton(frame: .zero))
  
  func configure(withTitle title: String) {
    titleLabel.text = title
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    preservesSuperviewLayoutMargins = true
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension AddNewAddressGlobalHeaderReusableView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(onMapButton)
    
    titleLabel.setContentHuggingPriority(.required, for: .vertical)
    titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
      titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      
      onMapButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 1.3),
      onMapButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: onMapButton.trailingAnchor),
    ])
  }
}
