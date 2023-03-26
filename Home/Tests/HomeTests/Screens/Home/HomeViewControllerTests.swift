//
//  HomeViewControllerTests.swift
//  
//
//  Created by joao.lucas.f.pereira on 26/03/23.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
import TestUtils
@testable import Home

final class HomeViewControllerTests: QuickSpec {
    override func spec() {
        describe("HomeViewController") {
            
            var sut: HomeViewController!
            var service: HomeService!
            var mock: APIClientMock!
            let window = UIWindow.framed()
            
            beforeEach {
                mock = APIClientMock()
                service = HomeService(client: mock)
            }
            
            afterEach {
                window.cleanTestWindow()
            }
            
            it("should validate layout with success") {
                mock.fileJson = "RestaurantList"
                mock.module = "Home"
                
                sut = HomeViewController(service: service)
                let navigation = UINavigationController(rootViewController: sut)
                window.showTestWindow(controller: navigation)
                
                expect(navigation) == snapshot()
            }
        }
    }
}
