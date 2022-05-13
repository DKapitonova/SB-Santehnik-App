//
//  GeneralOrderInfoPhotosItemCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoPhotosItemCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoPhotosItemCollectionViewCell.self))"
  
  let iconImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(systemName: "pencil", withConfiguration: UIImage.SymbolConfiguration(textStyle: .body, scale: .large))!
    $0.backgroundColor = .white
    $0.layer.cornerCurve = .continuous
    $0.layer.cornerRadius = 6.0
    $0.contentMode = .center
    $0.clipsToBounds = true
    return $0
  }(UIImageView(image: nil))
  
  let contentImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerCurve = .continuous
    $0.layer.cornerRadius = 10.0
    $0.clipsToBounds = true
    return $0
  }(UIImageView(image: nil))
  
  func configure(withImage image: UIImage) {
    contentImageView.image = image
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

extension GeneralOrderInfoPhotosItemCollectionViewCell {
  
  private func setupConstraints() {
    contentView.addSubview(contentImageView)
    contentView.addSubview(iconImageView)
    
    NSLayoutConstraint.activate([
      contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: contentImageView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: contentImageView.bottomAnchor),
      
      contentImageView.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
      contentImageView.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10.0),
      iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
      iconImageView.heightAnchor.constraint(equalToConstant: 30.0),
    ])
  }
}
