//
//  HomeServiceTests.swift
//
//
//  Created by João Lucas on 26/03/23.
//

import Networking
import TestUtils
import XCTest
@testable import Home

final class HomeServiceTests: XCTestCase {

    var sut: HomeService!
    var mock: APIClientMock!

    override func setUp() {
        super.setUp()

        mock = APIClientMock()
        sut = HomeService(client: mock)
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mock = nil
    }

    func testVerifyRestaurantListWithSuccess() {
        mock.fileJson = "RestaurantList"
        mock.module = "Home"

        sut.getRestaurantsList { result in
            switch result {
            case let .success(restaurant):
                XCTAssertEqual(restaurant[0].name, "Benjamin a Padaria")
                XCTAssertEqual(restaurant[0].category, "Padaria")
                XCTAssertEqual(restaurant[0].deliveryTime.max, 33)
                XCTAssertEqual(restaurant[0].deliveryTime.min, 23)
            case let .failure(error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
