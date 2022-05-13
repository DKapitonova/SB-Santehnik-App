//
//  ChooseOrderDateAvailabilityView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateAvailabilityView: UIView {
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Выбранное время доступно"
    $0.font = .preferredFont(forTextStyle: .headline)
    $0.textColor = .systemGreen
    return $0
  }(UILabel(frame: .zero))
  
  let subtitleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Точное время согласуется с оператором"
    $0.font = .preferredFont(forTextStyle: .footnote)
    $0.textColor = .label
    return $0
  }(UILabel(frame: .zero))
  
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

extension ChooseOrderDateAvailabilityView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16.0),
      trailingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 16.0),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
      subtitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16.0),
      trailingAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.trailingAnchor, constant: 16.0),
      bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10.0),
    ])
  }
}

extension ChooseOrderDateAvailabilityView {
 
  private func setupAppearance() {
    layer.cornerCurve = .continuous
    layer.cornerRadius = 10.0
    backgroundColor = .systemGreen.withAlphaComponent(0.2)
  }
}
