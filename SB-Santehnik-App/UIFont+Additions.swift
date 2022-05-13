//
//  UIFont+Additions.swift
//  Rocket10
//
//  Created by Ruslan Lutfullin on 13/05/22.
//

import UIKit

// MARK: -
extension UIFont {
  
  public static func preferredFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
    let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
    return .systemFont(ofSize: pointSize, weight: weight)
  }
  
  public static func preferredFont(forTextStyle style: TextStyle, partOfSymbolicTraits: UIFontDescriptor.PartOfSymbolicTraits) -> UIFont {
    guard let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: style)
      .withSymbolicTraits(partOfSymbolicTraits.symbolicTraits)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
}

extension UIFont {
  
  public static func monospacedSystemFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
    let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
    return .monospacedSystemFont(ofSize: pointSize, weight: weight)
  }
  
  public static func monospacedSystemFont(forTextStyle style: TextStyle, partOfSymbolicTraits: UIFontDescriptor.PartOfSymbolicTraits) -> UIFont {
    let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
    
    guard let descriptor = UIFont
      .monospacedSystemFont(ofSize: pointSize, weight: .regular)
      .fontDescriptor
      .withSymbolicTraits(partOfSymbolicTraits.symbolicTraits)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
}

extension UIFont {
  
  public static func monospacedDigitSystemFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
    let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
    return .monospacedDigitSystemFont(ofSize: pointSize, weight: weight)
  }
  
  public static func monospacedDigitSystemFont(forTextStyle style: TextStyle, partOfSymbolicTraits: UIFontDescriptor.PartOfSymbolicTraits) -> UIFont {
    let pointSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style).pointSize
    
    guard let descriptor = UIFont
      .monospacedDigitSystemFont(ofSize: pointSize, weight: .regular)
      .fontDescriptor
      .withSymbolicTraits(partOfSymbolicTraits.symbolicTraits)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
}

extension UIFont {
  
  public static func roundedSystemFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
    guard let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: style)
      .addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
      .withDesign(.rounded)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
  
  public static func roundedSystemFont(forTextStyle style: TextStyle, partOfSymbolicTraits: UIFontDescriptor.PartOfSymbolicTraits) -> UIFont {
    guard let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: style)
      .withSymbolicTraits(partOfSymbolicTraits.symbolicTraits)?
      .withDesign(.rounded)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
}

extension UIFont {
  
  public static func serifSystemFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
    guard let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: style)
      .addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
      .withDesign(.serif)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
  
  public static func serifSystemFont(forTextStyle style: TextStyle, partOfSymbolicTraits: UIFontDescriptor.PartOfSymbolicTraits) -> UIFont {
    guard let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: style)
      .withSymbolicTraits(partOfSymbolicTraits.symbolicTraits)?
      .withDesign(.serif)
    else { preconditionFailure() }
    
    return .init(descriptor: descriptor, size: 0.0)
  }
}

// MARK: -
extension UIFontDescriptor {
  
  public struct PartOfSymbolicTraits: OptionSet {
    
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
      self.rawValue = rawValue
    }
    
    public static var traitItalic = Self(rawValue: 1 << 0)
    
    public static var traitBold = Self(rawValue: 1 << 1)
    
    public var symbolicTraits: UIFontDescriptor.SymbolicTraits {
      var symbolicTraits: UIFontDescriptor.SymbolicTraits = []
      if self.contains(.traitItalic) { symbolicTraits.insert(.traitItalic) }
      if self.contains(.traitBold) { symbolicTraits.insert(.traitBold) }
      return symbolicTraits
    }
  }
}
