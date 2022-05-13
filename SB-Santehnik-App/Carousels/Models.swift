//
//  Models.swift
//  SB-Santehnik-App
//
//  Created by Daria on 30.11.2021.
//



import Foundation

import UIKit

//First carousel for sales

struct SalesModel {
    var mainImage : UIImage


static func fetchSale() -> [SalesModel] {
    let firstItem = SalesModel(mainImage: UIImage(named: "Sale")!)
    let secondItem = SalesModel(mainImage: UIImage(named: "Sale1")!)
    let thirdItem = SalesModel(mainImage: UIImage(named: "Sale")!)
    return [firstItem, secondItem, thirdItem]
}
    
  //  carousel for Santehnik services
    
}

struct SantehnikModel {
    var mainImage : UIImage
    
    static func fetchSantehnikServices() -> [SantehnikModel] {
        let firstItem = SantehnikModel(mainImage: UIImage(named: "Santehnik1")!)
        let secondItem = SantehnikModel(mainImage: UIImage(named: "Santehnik2")!)
        let thirdItem = SantehnikModel(mainImage: UIImage(named: "Santehnik1")!)
        let fourthItem = SantehnikModel(mainImage: UIImage(named: "Santehnik2")!)
        let fifthItem = SantehnikModel(mainImage: UIImage(named: "Santehnik1")!)
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}


struct ElectricModel {
    var mainImage : UIImage
    
    static func fetchElectricServices() -> [ElectricModel] {
        let firstItem = ElectricModel(mainImage: UIImage(named: "Santehnik1")!)
        let secondItem = ElectricModel(mainImage: UIImage(named: "Santehnik2")!)
        let thirdItem = ElectricModel(mainImage: UIImage(named: "Santehnik1")!)
        let fourthItem = ElectricModel(mainImage: UIImage(named: "Santehnik2")!)
        let fifthItem = ElectricModel(mainImage: UIImage(named: "Santehnik1")!)
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}

struct ZasorsModel {
    var mainImage : UIImage
    
    static func fetchZasorsServices() -> [ZasorsModel] {
        let firstItem = ZasorsModel(mainImage: UIImage(named: "Santehnik1")!)
        let secondItem = ZasorsModel(mainImage: UIImage(named: "Santehnik2")!)
        let thirdItem = ZasorsModel(mainImage: UIImage(named: "Santehnik1")!)
        let fourthItem = ZasorsModel(mainImage: UIImage(named: "Santehnik2")!)
        let fifthItem = ZasorsModel(mainImage: UIImage(named: "Santehnik1")!)
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}


struct MastersModel {
    var mainImage : UIImage
    
    static func fetchMasterServices() -> [MastersModel] {
        let firstItem = MastersModel(mainImage: UIImage(named: "Santehnik1")!)
        let secondItem = MastersModel(mainImage: UIImage(named: "Santehnik2")!)
        let thirdItem = MastersModel(mainImage: UIImage(named: "Santehnik1")!)
        let fourthItem = MastersModel(mainImage: UIImage(named: "Santehnik2")!)
        let fifthItem = MastersModel(mainImage: UIImage(named: "Santehnik1")!)
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
    }
}
