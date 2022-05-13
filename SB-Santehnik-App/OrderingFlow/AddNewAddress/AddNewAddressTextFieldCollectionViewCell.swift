//
//  AddNewAddressTextFieldCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class AddNewAddressTextFieldCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(AddNewAddressTextFieldCollectionViewCell.self))"
  
  let textField: AddNewAddressTextField = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(AddNewAddressTextField(frame: .zero))
  
  func configure(withPlaceholder placeholder: String) {
    textField.configure(withPlaceholder: placeholder)
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

extension AddNewAddressTextFieldCollectionViewCell {
  
  private func setupConstraints() {
    contentView.addSubview(textField)
    
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: contentView.topAnchor),
      textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
    ])
  }
}
