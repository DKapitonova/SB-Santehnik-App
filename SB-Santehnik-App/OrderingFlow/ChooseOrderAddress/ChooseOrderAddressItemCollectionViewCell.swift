//
//  ChooseOrderAddressItemCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderAddressItemCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(ChooseOrderAddressItemCollectionViewCell.self))"
  
  let iconImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .center
    return $0
  }(UIImageView(image: nil))
  
  let addressNameLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .headline)
    return $0
  }(UILabel(frame: .zero))
  
  let addressLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    $0.numberOfLines = 0
    return $0
  }(UILabel(frame: .zero))
  
  override var isSelected: Bool {
    didSet {
      contentView.backgroundColor = isSelected ? tintColor.withAlphaComponent(0.1) : .clear
      contentView.layer.borderColor = isSelected ? tintColor.cgColor : UIColor(red: 0.882, green: 0.89, blue: 0.894, alpha: 1).cgColor
      UIView.transition(with: iconImageView, duration: 0.2, options: [.transitionCrossDissolve, .allowAnimatedContent]) { [self] in
        let imageName = isSelected ? "circle.circle.fill" : "circle.circle"
        iconImageView.image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: .preferredFont(forTextStyle: .body), scale: .large))!
      }
    }
  }
  
  func configureWith(name: String, address: String) {
    addressNameLabel.text = name
    addressLabel.text = address
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    setupAppearance()
    defer { isSelected = false }
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension ChooseOrderAddressItemCollectionViewCell {
  
  private func setupConstraints() {
    contentView.addSubview(iconImageView)
    contentView.addSubview(addressNameLabel)
    contentView.addSubview(addressLabel)
    
    NSLayoutConstraint.activate([
      iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
      iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
      iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
      iconImageView.heightAnchor.constraint(equalToConstant: 20.0),
      
      addressNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
      addressNameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10.0),
      contentView.trailingAnchor.constraint(greaterThanOrEqualTo: addressNameLabel.trailingAnchor, constant: 16.0),
      
      addressLabel.topAnchor.constraint(equalTo: addressNameLabel.bottomAnchor),
      addressLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10.0),
      contentView.trailingAnchor.constraint(greaterThanOrEqualTo: addressLabel.trailingAnchor, constant: 16.0),
      contentView.bottomAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 16.0),
    ])
  }
}

extension ChooseOrderAddressItemCollectionViewCell {
  
  private func setupAppearance() {
    contentView.layer.cornerCurve = .continuous
    contentView.layer.cornerRadius = 10.0
    contentView.layer.borderWidth = 1.0
  }
}
