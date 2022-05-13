//
//  CarouselCollectionView.swift
//  SB-Santehnik-App
//
//  Created by Daria on 30.11.2021.
//

import UIKit

class CarouselCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [SalesModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [SalesModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reuseID, for: indexPath) as! CarouselCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 120)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }

}


class ElectricServicesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var cells = [ElectricModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [ElectricModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reuseID, for: indexPath) as! CarouselCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }

}


class SantehnikCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
  
    var cells = [SantehnikModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [SantehnikModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reuseID, for: indexPath) as! CarouselCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }

}

class ZasorsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var cells = [ZasorsModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [ZasorsModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reuseID, for: indexPath) as! CarouselCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }

}


class MasterCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var cells = [MastersModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cells: [MastersModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.reuseID, for: indexPath) as! CarouselCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }

}


