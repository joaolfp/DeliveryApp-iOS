//
//  HomeServiceTests.swift
//  
//
//  Created by joao.lucas.f.pereira on 26/03/23.
//

import Foundation
import Quick
import Nimble
import TestUtils
import Networking
@testable import Home

final class HomeServiceTests: QuickSpec {
    override func spec() {
        describe("HomeService") {
            
            var sut: HomeService!
            var mock: APIClientMock!
            
            beforeEach {
                mock = APIClientMock()
                sut = HomeService(client: mock)
            }
            
            it("verify restaurant list with success") {
                mock.fileJson = "RestaurantList"
                mock.module = "Home"
                
                sut.getRestaurantsList { result in
                    switch result {
                    case .success(let restaurant):
                        expect(restaurant[0].name).to(equal("Benjamin a Padaria"))
                        expect(restaurant[0].category).to(equal("Padaria"))
                        expect(restaurant[0].deliveryTime.max).to(equal(33))
                        expect(restaurant[0].deliveryTime.min).to(equal(23))
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
    }
}
