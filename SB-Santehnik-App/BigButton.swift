//
//  BigButton.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

// MARK: -
final class BigButton: UIControl {
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.numberOfLines = 1
    $0.font = .preferredFont(forTextStyle: .headline)
    $0.textColor = .white
    $0.isUserInteractionEnabled = false
    return $0
  }(UILabel(frame: .zero))
  
  override var intrinsicContentSize: CGSize { .init(width: UIView.noIntrinsicMetric, height: 46.0) }
  
  override var isEnabled: Bool {
    didSet {
      backgroundColor = isEnabled ? tintColor : .systemGray2
    }
  }
  
  override var isHighlighted: Bool {
    didSet {
      UIViewPropertyAnimator.runningPropertyAnimator(withDuration: isHighlighted ? 0.2 : 0.5, delay: 0.0) { [self] in
        alpha = isHighlighted ? 0.4 : 1.0
      }
    }
  }
  
  override func tintColorDidChange() {
    super.tintColorDidChange()
    guard isEnabled else { return }
    backgroundColor = tintColor
  }
  
  func configure(withTitle title: String) {
    titleLabel.text = title
  }
  
  func configure(withAttributedTitle attributedTitle: NSAttributedString) {
    titleLabel.attributedText = attributedTitle
  }
  
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

extension BigButton {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16.0),
      trailingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 16.0),
    ])
  }
}

extension BigButton {
  
  private func setupAppearance() {
    layer.cornerCurve = .continuous
    layer.cornerRadius = intrinsicContentSize.height / 2.0
  }
}
