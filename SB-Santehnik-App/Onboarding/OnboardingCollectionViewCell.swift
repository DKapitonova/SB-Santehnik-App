//
//  OnboardingCollectionViewCell.swift
//  SB-Santehnik-App
//
//  Created by Daria on 25.01.2022.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self )
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    
 
    
    func setup (_ slide : OnboardingSlide) {
        slideDescriptionLabel.numberOfLines = 0
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
