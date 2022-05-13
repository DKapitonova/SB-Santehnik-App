//
//  GeneralOrderInfoCollectionView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoCollectionView: UICollectionView {
 
  let continueButton: BigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "Выбрать адрес ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "arrow.right.circle")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    $0.isEnabled = false
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

extension GeneralOrderInfoCollectionView {
  
  private func setupConstraints() {
    addSubview(continueButton)
    
    NSLayoutConstraint.activate([
      continueButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 30.0),
    ])
  }
}
extension GeneralOrderInfoCollectionView {

  private func setupAppearance() {
    backgroundColor = .systemBackground
    delaysContentTouches = false
    keyboardDismissMode = .onDrag
  }
}

extension GeneralOrderInfoCollectionView {
  
  private func register() {
    register(GeneralOrderInfoGlobalHeaderReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoGlobalHeaderReusableView.kind, withReuseIdentifier: GeneralOrderInfoGlobalHeaderReusableView.id)
    register(GeneralOrderInfoTaskDescriptionHeaderReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoTaskDescriptionHeaderReusableView.kind, withReuseIdentifier: GeneralOrderInfoTaskDescriptionHeaderReusableView.id)
    register(GeneralOrderInfoPhotosHeaderReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoPhotosHeaderReusableView.kind, withReuseIdentifier: GeneralOrderInfoPhotosHeaderReusableView.id)
    register(GeneralOrderInfoPhotosFooterReusableView.self, forSupplementaryViewOfKind: GeneralOrderInfoPhotosFooterReusableView.kind, withReuseIdentifier: GeneralOrderInfoPhotosFooterReusableView.id)
    register(GeneralOrderInfoTaskDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: GeneralOrderInfoTaskDescriptionCollectionViewCell.id)
    register(GeneralOrderInfoPhotosItemCollectionViewCell.self, forCellWithReuseIdentifier: GeneralOrderInfoPhotosItemCollectionViewCell.id)
    register(GeneralOrderInfoPhotosAddCollectionViewCell.self, forCellWithReuseIdentifier: GeneralOrderInfoPhotosAddCollectionViewCell.id)
  }
}
