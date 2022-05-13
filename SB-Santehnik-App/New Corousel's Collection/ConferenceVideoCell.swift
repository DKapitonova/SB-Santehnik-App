
//  ConferenceVideoCell.swift
//  SB-Santehnik-App
//
//  Created by Daria on 03.02.2022.
//

import Foundation
import UIKit


// MARK: Cell for 1st section
class ConferenceVideoCell1st: UICollectionViewCell {
    
    static let reuseIdentifier = "video-cell-reuse-identifier1"
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView(frame: .zero))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ConferenceVideoCell1st {
    func configure() {
        contentView.addSubview(imageView)
        
        let preferredImageAspectRatio = 290.0 / 120.0
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            { $0.priority = .defaultHigh; return $0 }(contentView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0 / preferredImageAspectRatio),
        ])
    }
}



// MARK: Cell for 2st section
class ConferenceVideoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "video-cell-reuse-identifier2"
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView(frame: .zero))
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .preferredFont(forTextStyle: .caption1)
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

extension ConferenceVideoCell {
    func configure() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        let preferredImageAspectRatio = 150.0 / 100.0
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0 / preferredImageAspectRatio),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            { $0.priority = .defaultHigh; return $0 }(contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor))
        ])
    }
}
