//
//  CollectionViewViewController.swift
//  SB-Santehnik-App
//
//  Created by Daria on 02.02.2022.
//


import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    
    static let reuseIdentifier = "title-supplementary-reuse-identifier"
    
    let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .preferredFont(forTextStyle: .title2)
        $0.adjustsFontForContentSizeCategory = true
        return $0
    }(UILabel(frame: .zero))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TitleSupplementaryView {
    func configure() {
        addSubview(label)
        
        let inset = 10.0
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: label.trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            { $0.priority = .defaultHigh; return $0 }(bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: inset))
        ])
    }
}
