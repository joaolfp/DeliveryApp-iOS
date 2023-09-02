//
//  OptionsViewTests.swift
//  
//
//  Created by João Lucas on 05/04/23.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
@testable import Home

final class OptionsViewTests: QuickSpec {
    override class func spec() {
        describe("OptionsView") {
            
            it("should validate layout") {
                let view = OptionsView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
                
                let deliveryTime = DeliveryTime(min: 20, max: 30)
                let restaurantDTO = RestaurantsDTO(name: "Bar do João", category: "Bar", deliveryTime: deliveryTime)
                view.setup(data: [restaurantDTO, restaurantDTO, restaurantDTO, restaurantDTO, restaurantDTO])
                
                expect(view) == snapshot()
            }
        }
    }
}
