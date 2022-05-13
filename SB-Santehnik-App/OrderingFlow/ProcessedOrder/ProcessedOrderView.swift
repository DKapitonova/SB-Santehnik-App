//
//  ProcessedOrderView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

// MARK: -
final class ProcessedOrderView: UIView {
  
  let iconImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = .init(systemName: "checkmark.circle", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 80.0), scale: .large))
    $0.contentMode = .center
    return $0
  }(UIImageView(image: nil))
  
  let idLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .title1, partOfSymbolicTraits: .traitBold)
    $0.numberOfLines = 2
    $0.textAlignment = .center
    return $0
  }(UILabel(frame: .zero))
  
  let serviceTitleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Услуга"
    $0.textColor = .secondaryLabel
    $0.font = .preferredFont(forTextStyle: .headline)
    return $0
  }(UILabel(frame: .zero))
  
  let serviceContentLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel(frame: .zero))
  
  let dateTitleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Указанное время визита"
    $0.textColor = .secondaryLabel
    $0.font = .preferredFont(forTextStyle: .headline)
    return $0
  }(UILabel(frame: .zero))
  
  let dateContentLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .label
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel(frame: .zero))
  
  let stackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.alignment = .center
    return $0
  }(UIStackView(frame: .zero))
  
  let bottomView: ProcessedOrderBottomView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(ProcessedOrderBottomView(frame: .zero))
  
  func configureWith(id: Int, service: String, date: String) {
    let idAttributedText = NSMutableAttributedString(string: "Заказ", attributes: [.foregroundColor: UIColor.label])
    idAttributedText.append(.init(string: " №\(id)\n", attributes: [.foregroundColor: tintColor!]))
    idAttributedText.append(.init(string: "оформлен", attributes: [.foregroundColor: UIColor.label]))
    idLabel.attributedText = idAttributedText
    
    serviceContentLabel.text = service
    
    dateContentLabel.text = date
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

extension ProcessedOrderView {
  
  private func setupConstraints() {
    stackView.addArrangedSubview(iconImageView)
    stackView.addArrangedSubview(idLabel)
    stackView.addArrangedSubview(serviceTitleLabel)
    stackView.addArrangedSubview(serviceContentLabel)
    stackView.addArrangedSubview(dateTitleLabel)
    stackView.addArrangedSubview(dateContentLabel)
    
    addSubview(stackView)
    addSubview(bottomView)
    
    stackView.setCustomSpacing(25, after: iconImageView)
    stackView.setCustomSpacing(25, after: idLabel)
    stackView.setCustomSpacing(25, after: serviceContentLabel)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
    ])
  }
}

extension ProcessedOrderView {
  
  private func setupAppearance() {
    backgroundColor = .systemBackground
  }
}
