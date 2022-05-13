//
//  ChooseOrderDateTimePickerItem.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateTimePickerItem: UIView {
  
  let timeLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .title2, weight: .bold)
    return $0
  }(UILabel(frame: .zero))
  
  let availabilityLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .caption2, weight: .semibold)
    return $0
  }(UILabel(frame: .zero))
  
  let stackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.alignment = .center
    return $0
  }(UIStackView(frame: .zero))
  
  override var intrinsicContentSize: CGSize { .init(width: 100.0, height: 100.0) }
  
  override func tintColorDidChange() {
    super.tintColorDidChange()
    timeLabel.textColor = tintColor
    availabilityLabel.textColor = tintColor
  }
  
  func configureWith(time: String, isAvailable: Bool) {
    timeLabel.text = time
    availabilityLabel.text = isAvailable ? " " : "НЕДОСТУПНО"
    backgroundColor = isAvailable ? .clear : .tertiarySystemFill
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    transform = .init(rotationAngle: .pi / 2.0)
    layer.cornerCurve = .continuous
    layer.cornerRadius = 10.0
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension ChooseOrderDateTimePickerItem {
  
  private func setupConstraints() {
    stackView.addArrangedSubview(timeLabel)
    stackView.addArrangedSubview(availabilityLabel)
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0),
      trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5.0),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
