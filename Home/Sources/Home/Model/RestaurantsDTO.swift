//
//  RestaurantsDTO.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

struct RestaurantsDTO: Codable {
    
    let name: String
    let category: String
    let deliveryTime: DeliveryTime

    enum CodingKeys: String, CodingKey {
        case name
        case category
        case deliveryTime = "delivery_time"
    }
}

struct DeliveryTime: Codable {
    let min: Int
    let max: Int
}
