//
//  GeneralOrderInfoTaskDescriptionCollectionViewCell.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class GeneralOrderInfoTaskDescriptionCollectionViewCell: UICollectionViewCell {
  
  static let id = "\(NSStringFromClass(GeneralOrderInfoTaskDescriptionCollectionViewCell.self))"
  
  private let placeholder = "Чем точнее описание — тем быстрее мы сможем обработать заявку"
  
  private(set) lazy var textView: UITextView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = placeholder
    $0.textColor = .placeholderText
    $0.backgroundColor = UIColor(red: 0.957, green: 0.965, blue: 0.969, alpha: 1)
    $0.font = .preferredFont(forTextStyle: .body)
    $0.contentInset = .init(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    $0.layer.cornerCurve = .continuous
    $0.layer.cornerRadius = 10.0
    $0.layer.borderWidth = 1.0
    $0.layer.borderColor = UIColor(red: 0.882, green: 0.89, blue: 0.894, alpha: 1).cgColor
    $0.delegate = self
    return $0
  }(UITextView(frame: .zero))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension GeneralOrderInfoTaskDescriptionCollectionViewCell {
  
  private func setupConstraints() {
    contentView.addSubview(textView)
    
    NSLayoutConstraint.activate([
      textView.topAnchor.constraint(equalTo: contentView.topAnchor),
      textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
      textView.heightAnchor.constraint(equalToConstant: 150.0),
      contentView.bottomAnchor.constraint(equalTo: textView.bottomAnchor),
    ])
  }
}


extension GeneralOrderInfoTaskDescriptionCollectionViewCell: UITextViewDelegate {
    
  func textViewDidBeginEditing(_ textView: UITextView) {
    guard textView.text == placeholder else { return }
    textView.text = nil
    textView.textColor = .label
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    guard textView.text.isEmpty else { return }
    textView.text = placeholder
    textView.textColor = .placeholderText
  }
}
