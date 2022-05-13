//
//  SearchViewCellTableViewCell.swift
//  SB-Santehnik-App
//
//  Created by Daria on 01.12.2021.
//

import UIKit

class ServiceCell: UITableViewCell {

    let titleService: UILabel = {
        let service = UILabel()
        service.translatesAutoresizingMaskIntoConstraints = false
        
        return service
    }()
    
    let titlePrice: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        price.textAlignment = .right
        
        
        return price
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titlePrice)
        addSubview(titleService)
        
        titleService.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleService.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleService.rightAnchor.constraint(equalTo: titlePrice.leftAnchor).isActive = true
        titleService.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titlePrice.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titlePrice.widthAnchor.constraint(equalToConstant:120).isActive = true
        titlePrice.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        titlePrice.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
        required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has no been implemented")
}

}

