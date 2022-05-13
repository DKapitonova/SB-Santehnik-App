//
//  GeneralOrderInfoPhotosAddCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoPhotosAddCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoPhotosAddCollectionViewCell.self))"
  
  let iconImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(systemName: "photo", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title2, scale: .default))!
    return $0
  }(UIImageView(image: nil))
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Добавить фото"
    $0.font = .preferredFont(forTextStyle: .caption1)
    return $0
  }(UILabel(frame: .zero))
  
  let stackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.alignment = .center
    $0.spacing = 10
    return $0
  }(UIStackView(frame: .zero))
  
  override func tintColorDidChange() {
    super.tintColorDidChange()
    iconImageView.tintColor = tintColor
    titleLabel.textColor = tintColor
    contentView.layer.borderColor = tintColor.cgColor
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    setupAppearance()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension GeneralOrderInfoPhotosAddCollectionViewCell {
  
  private func setupConstraints() {
    stackView.addArrangedSubview(iconImageView)
    stackView.addArrangedSubview(titleLabel)
    
    contentView.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}

extension GeneralOrderInfoPhotosAddCollectionViewCell {
  
  private func setupAppearance() {
    contentView.layer.cornerCurve = .continuous
    contentView.layer.cornerRadius = 10.0
    contentView.layer.borderWidth = 1.0
  }
}
