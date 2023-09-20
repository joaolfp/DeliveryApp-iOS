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
    
    func testVerifyLoadingWithSuccess() {
        let sut = HomeViewModel()
        let state = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertTrue(state.isLoading)
    }
    
    func testVerifyRestaurantListWithSuccess() {
        let mock = HomeServiceMock(stateMock: .success)
        let sut = HomeViewModel(service: mock)
        let state = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertEqual(state.restaurants?[0].name, "Benjamin a Padaria")
        XCTAssertEqual(state.restaurants?[0].category, "Padaria")
        XCTAssertEqual(state.restaurants?[0].deliveryTime.max, 33)
        XCTAssertEqual(state.restaurants?[0].deliveryTime.min, 23)
    }
    
    func testVerifyRestaurantListWithFailure() {
        let mock = HomeServiceMock(stateMock: .failure)
        let sut = HomeViewModel(service: mock)
        let state = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertEqual(state.error?.localizedDescription, "JSON parsing failure")
    }

}

final class HomeViewModelStates {
    
    var isLoading: Bool = false
    var restaurants: [RestaurantsDTO]?
    var error: APIError?
    
    func onLoading() {
        self.isLoading = true
    }
    
    func onSuccess(restaurants: [RestaurantsDTO]) {
        self.restaurants = restaurants
        self.isLoading = false
    }
    
    func onFailure(error: APIError) {
        self.error = error
    }
}
