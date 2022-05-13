//
//  ConferenceVideoController.swift
//  SB-Santehnik-App
//
//  Created by Daria on 03.02.2022.
//

import Foundation
import UIKit


final class ConferenceVideoController {
    
    
    struct ItemType1: Hashable {
           
            let image : UIImage
            let identifier = UUID()
        
            func hash(into hasher: inout Hasher) {
                hasher.combine(identifier)
            }
        }

  struct ItemType2: Hashable {
        let title: String
        let image : UIImage
        let category: String
        let identifier = UUID()
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }
    


    /*
    struct SectionType1: Hashable {
        
        let items : [ItemModel1]
        let identifier = UUID()
        
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }

    struct SectionType2: Hashable {
        let title : String
        let items: [ItemModel2]
        
        let identifier = UUID()
        
        func hash(into hasher : inout Hasher) {
            hasher.combine(identifier)
        }
    } */
    
    enum Item : Hashable {
        case type1(ItemType1)
        case type2(ItemType2)
    }
    
    enum Section: Hashable {
        case type1
        case type2(title: String)
    }
    
    struct Pair : Hashable {
        let sections : Section
        let items: [Item]
    }
    
    private(set) var pairs: [Pair] = []
    
    


    init() {
        generateCollections()
    }
   
}

extension ConferenceVideoController {
    func generateCollections() {
        pairs = [
            Pair(sections: .type1, items: [
                .type1(ItemType1(image: UIImage(named: "Sale")!)),
                .type1(ItemType1(image: UIImage(named: "Sale")!)),
                .type1(ItemType1(image: UIImage(named: "Sale")!)),
                .type1(ItemType1(image: UIImage(named: "Sale")!))
            ]),
            Pair(sections: .type2(title: "Сантехника"), items: [
                .type2(ItemType2(title: "Ремонт труб", image: UIImage(named: "Santehnik1")!, category: "")),
                .type2(ItemType2(title: "Ремонт ванны", image: UIImage(named: "Santehnik2")!, category: "")),
                .type2(ItemType2(title: "Ремонт труб", image: UIImage(named: "Santehnik1")!, category: ""))]),
            
            Pair(sections: .type2(title: "Электрика"), items: [
                .type2(ItemType2(title: "Замена проводки", image: UIImage(named: "Santehnik1")!, category: "")),
                .type2(ItemType2(title: "Монтаж проводки", image: UIImage(named: "Santehnik2")!, category: "")),
                .type2(ItemType2(title: "Замена проводки", image: UIImage(named: "Santehnik1")!, category: ""))]),
            
            Pair(sections: .type2(title: "Устранение засоров"), items: [
                .type2(ItemType2(title: "Устранение засоров", image: UIImage(named: "Santehnik1")!, category: "")),
                .type2(ItemType2(title: "Устранение засоров", image: UIImage(named: "Santehnik2")!, category: "")),
                .type2(ItemType2(title: "Устранение засоров", image: UIImage(named: "Santehnik1")!, category: ""))]),
            
            Pair(sections: .type2(title: "Мастер на час"), items: [
                .type2(ItemType2(title: "Мастер на час", image: UIImage(named: "Santehnik1")!, category: "")),
                .type2(ItemType2(title: "Мастер на час", image: UIImage(named: "Santehnik2")!, category: "")),
                .type2(ItemType2(title: "Мастер на час", image: UIImage(named: "Santehnik1")!, category: ""))]),
            
                
                ]
            

            
            
/*
            VideoCollection(title: "Сантехника", image: UIImage(named: "Sale")!,
                            videos: [Video(title: "Ремонт труб", image: UIImage(named: "Santehnik1")!, category: ""),
                                      Video(title: "Ремонт ванны", image:  UIImage(named: "Santehnik2")!, category: ""),
                                      Video(title: "Ремонт труб", image: UIImage(named: "Santehnik1")!, category: "")]),

            VideoCollection(title: "Электрика", image: UIImage(named: "Sale")!,
                            videos: [Video(title: "Замена проводки", image: UIImage(named: "Santehnik2")!, category: ""),
                                      Video(title: "Монтаж проводки", image: UIImage(named: "Santehnik1")!, category: ""),
                                      Video(title: "Замена проводки", image: UIImage(named: "Santehnik2")!, category: "")]),

            VideoCollection(title: "Устранение засоров", image: UIImage(named: "Sale")!,
                            videos: [Video(title: "Устранение засоров", image: UIImage(named: "Santehnik2")!, category: ""),
                                      Video(title: "Устранение засоров", image: UIImage(named: "Santehnik2")!, category: ""),
                                      Video(title: "Устранение засоров", image: UIImage(named: "Santehnik2")!, category: "")]),

            VideoCollection(title: "Мастер на час", image: UIImage(named: "Sale")!,
                            videos: [Video(title: "Мастер на час", image: UIImage(named: "Santehnik2")!, category: ""),
                                     Video(title: "Час на мастер", image: UIImage(named: "Santehnik2")!, category: ""),
                                     Video(title: "Мастер на час", image: UIImage(named: "Santehnik2")!, category: ""),
                                     Video(title: "Час на мастер", image: UIImage(named: "Santehnik2")!, category: "")])  */
        
    }
}

