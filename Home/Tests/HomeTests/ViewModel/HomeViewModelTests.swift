//
//  HomeViewModelTests.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import XCTest
import Core
import Networking
import TestUtils
@testable import Home

final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    var service: HomeService!
    var mock: APIClientMock!
    
    override func setUp() {
        super.setUp()
        
        mock = APIClientMock()
        service = HomeService(client: mock)
        sut = HomeViewModel(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mock = nil
        service = nil
        sut = nil
    }
    
    func testVerifyRestaurantListWithSuccess() {
        mock.fileJson = "RestaurantList"
        mock.module = "Home"
        
        let states = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(states.onLoading)
            .successObserver(states.onSuccess)
            .errorObserver(states.onFailure)
        
        XCTAssertEqual(states.restaurants?[0].name, "Benjamin a Padaria")
        XCTAssertEqual(states.restaurants?[0].category, "Padaria")
        XCTAssertEqual(states.restaurants?[0].deliveryTime.max, 33)
        XCTAssertEqual(states.restaurants?[0].deliveryTime.min, 23)
    }
    
    func verifyRestaurantListWithFailure() {
        mock.failure = true
        mock.module = "Home"
        
        let states = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(states.onLoading)
            .successObserver(states.onSuccess)
            .errorObserver(states.onFailure)
        
        XCTAssertEqual(states.error?.localizedDescription, "JSON parsing failure")
    }

}

final class HomeViewModelStates {
    
    var restaurants: [RestaurantsDTO]?
    var error: APIError?
    
    func onLoading() { }
    
    func onSuccess(restaurants: [RestaurantsDTO]) {
        self.restaurants = restaurants
    }
    
    func onFailure(error: APIError) {
        self.error = error
    }
}
