//
//  RestaurantViewTests.swift
//
//
//  Created by João Lucas on 26/03/23.
//

@testable import Home
import SnapshotTesting
import UIKit
import XCTest

final class RestaurantViewTests: XCTestCase {

    func testShouldValidateLayout() {
        let view = RestaurantView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250))

        let deliveryTime = DeliveryTime(min: 20, max: 30)
        let restaurantDTO = RestaurantsDTO(name: "Bar do João", category: "Bar", deliveryTime: deliveryTime)
        view.setup(data: [restaurantDTO, restaurantDTO, restaurantDTO])

        assertSnapshot(of: view, as: .image)
    }
}
