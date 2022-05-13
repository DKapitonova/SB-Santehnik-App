//
//  ServiceModel.swift
//  SB-Santehnik-App
//
//  Created by Daria on 01.12.2021.
//

import Foundation

struct Services {
    let price : String
    let service: String
    
    static func GetAllServices() -> [Services] {
        return [
        Services(price: "от 250", service: "Замена душевой кабины"),
        Services(price: "до 150", service: "Установка инсталляции Geberit"),
        Services(price: "от 32350", service: "Замена слива"),
        Services(price: "от 34350", service: "Замена раковины"),
        Services(price: "от 432350", service: "Замена мойки"),
        Services(price: "от 32350", service: "Замена тэна в стиральной машине"),
        Services(price: "от 33450", service: "Ремонт ванны"),
        Services(price: "от 342350", service: "Установка инсталляции Geberit"),
        Services(price: "от 432350", service: "Замена шаровых кранов"),
        Services(price: "от 343250", service: "Установка мойки"),
        Services(price: "от 34350", service: "Установка радиаторов отопления"),
        Services(price: "от 38650", service: "Ремонт радиатора отопления")
        
        ]
    } 
}
