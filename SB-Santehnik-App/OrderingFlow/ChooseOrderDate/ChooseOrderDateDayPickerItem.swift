//
//  ChooseOrderDateDayPickerItem.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateDayPickerItem: UIView {
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .footnote, weight: .bold)
    return $0
  }(UILabel(frame: .zero))
  
  let numberLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .title2, weight: .bold)
    return $0
  }(UILabel(frame: .zero))
  
  let isTodayLabel: UILabel = {
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
    titleLabel.textColor = tintColor
    numberLabel.textColor = tintColor
    isTodayLabel.textColor = tintColor.withAlphaComponent(0.8)
  }
  
  func configureWith(title: String, number: Int, isToday: Bool) {
    titleLabel.text = title
    numberLabel.text = "\(number)"
    isTodayLabel.text = isToday ? "СЕГОДНЯ" : " "
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    transform = .init(rotationAngle: .pi / 2.0)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension ChooseOrderDateDayPickerItem {
  
  private func setupConstraints() {
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(numberLabel)
    stackView.addArrangedSubview(isTodayLabel)
    
    addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0),
      trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 5.0),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
