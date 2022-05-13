//
//  ChooseOrderDateView.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

final class ChooseOrderDateView: UIView {
  
  private var isLayoutSubviewsVisitedOnce = false
  
  let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .preferredFont(forTextStyle: .title1, partOfSymbolicTraits: .traitBold)
    $0.text = "Выберите дату и время"
    return $0
  }(UILabel(frame: .zero))
  
  let monthPicker: UIDatePicker = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.datePickerMode = .date
    $0.preferredDatePickerStyle = .compact
    $0.calendar = .current
    return $0
  }(UIDatePicker(frame: .zero))
  
  private(set) lazy var dayPickerview: UIPickerView = {
    $0.dataSource = self
    $0.delegate = self
    $0.transform = .init(rotationAngle: -.pi / 2.0)
    return $0
  }(UIPickerView(frame: .zero))
  
  private(set) lazy var timePickerview: UIPickerView = {
    $0.dataSource = self
    $0.delegate = self
    $0.transform = .init(rotationAngle: -.pi / 2.0)
    return $0
  }(UIPickerView(frame: .zero))
  
  let availabilityView: ChooseOrderDateAvailabilityView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(ChooseOrderDateAvailabilityView(frame: .zero))
  
  let bottomView: ChooseOrderDateBottomView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(ChooseOrderDateBottomView(frame: .zero))
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    guard !isLayoutSubviewsVisitedOnce else { return }
    isLayoutSubviewsVisitedOnce = true
    
    dayPickerview.bounds.size = .init(width: 120.0, height: bounds.width * 3.0)
    dayPickerview.frame.origin = .init(x: -bounds.width, y: monthPicker.frame.maxY + 20.0)
    
    timePickerview.bounds.size = .init(width: 120.0, height: bounds.width * 3.0)
    timePickerview.frame.origin = .init(x: -bounds.width, y: dayPickerview.frame.maxY + 20.0)
    
    func updateHighlightView(_ highlightView: UIView) {
      highlightView.layer.cornerCurve = .continuous
      highlightView.layer.cornerRadius = 10.0
      highlightView.layer.borderColor = UIColor.systemBlue.cgColor
      highlightView.layer.borderWidth = 2.0
      highlightView.backgroundColor = .clear
    }
    
    if let dayHighlightView = dayPickerview.subviews.last {
      updateHighlightView(dayHighlightView)
    }
    
    if let timeHighlightView = timePickerview.subviews.last {
      updateHighlightView(timeHighlightView)
    }
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

extension ChooseOrderDateView {
  
  private func setupConstraints() {
    addSubview(titleLabel)
    addSubview(monthPicker)
    addSubview(dayPickerview)
    addSubview(timePickerview)
    addSubview(availabilityView)
    addSubview(bottomView)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0),
      titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      
      monthPicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0),
      monthPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      availabilityView.topAnchor.constraint(equalTo: centerYAnchor, constant: 50.0),
      availabilityView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
      safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor)
    ])
  }
}

extension ChooseOrderDateView {
  
  private func setupAppearance() {
    backgroundColor = .systemBackground
  }
}

extension ChooseOrderDateView: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    10
  }
}

extension ChooseOrderDateView: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    if pickerView === dayPickerview {
      let item: ChooseOrderDateDayPickerItem
      
      if let view = view as? ChooseOrderDateDayPickerItem {
        item = view
      } else {
        item = .init(frame: .init(origin: .zero, size: .zero))
        item.configureWith(title: "СБ", number: 17, isToday: row == 3 ? true : false)
      }
      item.tintColor = .label
      
      return item
      
    } else if pickerView === timePickerview {
      let item: ChooseOrderDateTimePickerItem
      
      if let view = view as? ChooseOrderDateTimePickerItem {
        item = view
      } else {
        item = .init(frame: .init(origin: .zero, size: .zero))
        item.configureWith(time: "9:21", isAvailable: .random())
      }
      item.tintColor = .label
      
      return item
      
    } else {
      preconditionFailure()
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerView.view(forRow: row, forComponent: component)?.tintColor = tintColor
  }
  
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return 100.0
  }

  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 100.0
  }
}
