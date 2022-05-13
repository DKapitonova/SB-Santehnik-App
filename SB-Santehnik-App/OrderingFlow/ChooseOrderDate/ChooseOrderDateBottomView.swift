//
//  ChooseOrderDateBottomView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateBottomView: UIView {
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Точная стоимость оценивается мастером,\nоценка и вызов — бесплатно"
    $0.font = .preferredFont(forTextStyle: .headline)
    $0.numberOfLines = 0
    $0.textColor = .label
    $0.textAlignment = .center
    return $0
  }(UILabel(frame: .zero))
  
  let continueButton: BigButton = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let attributedTitle = NSMutableAttributedString(string: "Разместить заказ ")
    attributedTitle.append(.init(attachment: NSTextAttachment(image: .init(systemName: "checkmark.circle")!)))
    $0.configure(withAttributedTitle: attributedTitle)
    return $0
  }(BigButton(frame: .zero))
  
  let topSeparatorView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .opaqueSeparator
    return $0
  }(UIView(frame: .zero))
  
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

extension ChooseOrderDateBottomView {
  
  private func setupConstraints() {
    addSubview(topSeparatorView)
    addSubview(titleLabel)
    addSubview(continueButton)
    
    NSLayoutConstraint.activate([
      topSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: topSeparatorView.trailingAnchor),
      topSeparatorView.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale),
      
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      continueButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16.0),
      continueButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      layoutMarginsGuide.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor),
      bottomAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 30.0),
    ])
  }
}
