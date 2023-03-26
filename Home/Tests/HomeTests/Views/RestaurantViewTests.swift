//
//  RestaurantViewTests.swift
//  
//
//  Created by joao.lucas.f.pereira on 26/03/23.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
@testable import Home

final class RestaurantViewTests: QuickSpec {
    override func spec() {
        describe("RestaurantView") {
            
            it("should validate layout") {
                let view = RestaurantView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250))
                
                let deliveryTime = DeliveryTime(min: 20, max: 30)
                let restaurantDTO = RestaurantsDTO(name: "Bar do João", category: "Bar", deliveryTime: deliveryTime)
                view.setup(data: [restaurantDTO, restaurantDTO, restaurantDTO])
                
                expect(view) == snapshot()
            }
        }
    }
}
