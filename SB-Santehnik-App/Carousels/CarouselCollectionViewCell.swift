//
//  CarouselCollectionViewCell.swift
//  SB-Santehnik-App
//
//  Created by Daria on 30.11.2021.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CarouselCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        return imageView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
    
    
}
