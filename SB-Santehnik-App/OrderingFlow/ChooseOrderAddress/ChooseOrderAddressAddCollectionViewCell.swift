//
//  ChooseOrderAddressAddCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderAddressAddCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(ChooseOrderAddressAddCollectionViewCell.self))"
  
  weak var delegate: ChooseOrderAddressAddCollectionViewCellDelegate?
  
  private(set) lazy var button: OutlineBigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "Добавить новый адрес ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "plus.circle")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
    return $0
  }(OutlineBigButton(frame: .zero))
  
  @objc private func buttonDidTapped(_ sender: OutlineBigButton) {
    delegate?.didTapped(in: self)
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

extension ChooseOrderAddressAddCollectionViewCell {
  
  private func setupConstraints() {
    contentView.addSubview(button)
    
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: contentView.topAnchor),
      button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: button.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
    ])
  }
}

protocol ChooseOrderAddressAddCollectionViewCellDelegate: AnyObject {
  
  func didTapped(in cell: ChooseOrderAddressAddCollectionViewCell)
}
 
