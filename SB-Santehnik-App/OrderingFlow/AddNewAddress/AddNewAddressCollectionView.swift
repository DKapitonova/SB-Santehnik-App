//
//  AddNewAddressCollectionView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class AddNewAddressCollectionView: UICollectionView {
  
  let continueButton: BigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "Сохранить и выбрать время ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "arrow.right.circle")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    //$0.isEnabled = false
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

extension AddNewAddressCollectionView {
  
  private func setupConstraints() {
    addSubview(continueButton)
    
    NSLayoutConstraint.activate([
      continueButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 30.0),
    ])
  }
}

extension AddNewAddressCollectionView {

  private func setupAppearance() {
    backgroundColor = .systemBackground
    delaysContentTouches = false
    keyboardDismissMode = .onDrag
  }
}

extension AddNewAddressCollectionView {
  
  private func register() {
    register(AddNewAddressGlobalHeaderReusableView.self, forSupplementaryViewOfKind: AddNewAddressGlobalHeaderReusableView.kind, withReuseIdentifier: AddNewAddressGlobalHeaderReusableView.id)
    register(GeneralOrderInfoTaskDescriptionHeaderReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoTaskDescriptionHeaderReusableView.kind, withReuseIdentifier: GeneralOrderInfoTaskDescriptionHeaderReusableView.id)
    register(GeneralOrderInfoTaskDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: GeneralOrderInfoTaskDescriptionCollectionViewCell.id)
    register(AddNewAddressTextFieldCollectionViewCell.self, forCellWithReuseIdentifier: AddNewAddressTextFieldCollectionViewCell.id)
  }
}
