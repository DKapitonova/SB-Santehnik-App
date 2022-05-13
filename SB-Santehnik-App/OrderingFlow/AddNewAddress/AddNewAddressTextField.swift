//
//  AddNewAddressTextField.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class AddNewAddressTextField: UITextField {
  
  let placeholderLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .placeholderText
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel(frame: .zero))
  
  override var intrinsicContentSize: CGSize { .init(width: UIView.noIntrinsicMetric, height: 50.0) }
  
  func configure(withPlaceholder placeholder: String) {
    placeholderLabel.text = placeholder
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    var rect = super.editingRect(forBounds: bounds)
    rect.origin.x += 16.0
    rect.origin.y += 8.0
    return rect
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    var rect = super.textRect(forBounds: bounds)
    rect.origin.x += 16.0
    rect.origin.y += 8.0
    return rect
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    setupAppearance()
    delegate = self
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension AddNewAddressTextField {
  
  private func setupConstraints() {
    addSubview(placeholderLabel)
    
    NSLayoutConstraint.activate([
      placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
      trailingAnchor.constraint(greaterThanOrEqualTo: placeholderLabel.trailingAnchor, constant: 16.0),
      placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}

extension AddNewAddressTextField {
  
  private func setupAppearance() {
    backgroundColor = UIColor(red: 0.957, green: 0.965, blue: 0.969, alpha: 1)
    layer.cornerCurve = .continuous
    layer.cornerRadius = 10.0
    layer.borderWidth = 0.5
    layer.borderColor = UIColor(red: 0.882, green: 0.89, blue: 0.894, alpha: 1).cgColor
    font = .preferredFont(forTextStyle: .body)
  }
}

extension AddNewAddressTextField: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    layer.borderColor = tintColor.cgColor
    
    guard textField.text?.isEmpty == true else { return true }
    
    let sizeDiff = CGSize(width: placeholderLabel.bounds.width * 0.3, height: placeholderLabel.bounds.height * 0.3)
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0.0) { [self] in
      placeholderLabel.transform = .init(scaleX: 0.7, y: 0.7)
        .concatenating(.init(translationX: -sizeDiff.width / 2.0, y: -(placeholderLabel.frame.minY - 8.0 + sizeDiff.height / 2.0)))
    }
    
    return true
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    layer.borderColor = UIColor(red: 0.882, green: 0.89, blue: 0.894, alpha: 1).cgColor
    
    guard textField.text?.isEmpty == true else { return true }
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0.0) { [self] in
      placeholderLabel.transform = .identity
    }
    
    return true
  }
}
