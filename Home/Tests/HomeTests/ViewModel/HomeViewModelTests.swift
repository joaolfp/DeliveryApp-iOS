//
//  HomeViewModelTests.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation
import Core
import Networking
import Quick
import Nimble
import TestUtils
@testable import Home

final class HomeViewModelTests: QuickSpec {
    override class func spec() {
        describe("HomeViewModel") {
            
            var sut: HomeViewModel!
            var service: HomeService!
            var mock: APIClientMock!
            
            beforeEach {
                mock = APIClientMock()
                service = HomeService(client: mock)
                sut = HomeViewModel(service: service)
            }
            
            it("verify restaurant list with success") {
                mock.fileJson = "RestaurantList"
                mock.module = "Home"
                
                let states = HomeViewModelStates()
                
                sut.fetchRestaurants()
                    .loadingObserver(states.onLoading)
                    .successObserver(states.onSuccess)
                    .errorObserver(states.onFailure)
            }
            
            it("verify restaurant list with failure") {
                mock.failure = true
                mock.module = "Home"
                
                let states = HomeViewModelStates()
                
                sut.fetchRestaurants()
                    .loadingObserver(states.onLoading)
                    .successObserver(states.onSuccess)
                    .errorObserver(states.onFailure)
            }
        }
    }
}

final class HomeViewModelStates {
    
    func onLoading() { }
    
    func onSuccess(restaurants: [RestaurantsDTO]) {
        expect(restaurants[0].name).to(equal("Benjamin a Padaria"))
        expect(restaurants[0].category).to(equal("Padaria"))
        expect(restaurants[0].deliveryTime.max).to(equal(33))
        expect(restaurants[0].deliveryTime.min).to(equal(23))
    }
    
    func onFailure(error: APIError) {
        expect(error.localizedDescription).to(equal("JSON parsing failure"))
    }
}
