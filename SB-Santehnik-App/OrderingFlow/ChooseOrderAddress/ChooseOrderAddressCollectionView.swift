//
//  ChooseOrderAddressCollectionView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderAddressCollectionView: UICollectionView {
  
  let continueButton: BigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "Выбрать время ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "arrow.right.circle")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    return $0
  }(BigButton(frame: .zero))
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    register()
    setupConstraints()
    setupAppearance()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension ChooseOrderAddressCollectionView {
  
  private func setupConstraints() {
    addSubview(continueButton)
    
    NSLayoutConstraint.activate([
      continueButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 30.0),
    ])
  }
}
extension ChooseOrderAddressCollectionView {

  private func setupAppearance() {
    backgroundColor = .systemBackground
    delaysContentTouches = false
  }
}

extension ChooseOrderAddressCollectionView {
  
  private func register() {
    register(GeneralOrderInfoGlobalHeaderReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoGlobalHeaderReusableView.kind, withReuseIdentifier: GeneralOrderInfoGlobalHeaderReusableView.id)
    register(ChooseOrderAddressItemCollectionViewCell.self, forCellWithReuseIdentifier: ChooseOrderAddressItemCollectionViewCell.id)
    register(ChooseOrderAddressAddCollectionViewCell.self, forCellWithReuseIdentifier: ChooseOrderAddressAddCollectionViewCell.id)
  }
}
