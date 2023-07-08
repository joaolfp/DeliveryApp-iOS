//
//  HomeCoordinatorTests.swift
//  
//
//  Created by João Lucas on 05/04/23.
//

import UIKit
import Quick
import Nimble
import TestUtils
@testable import Home

final class HomeCoordinatorTests: QuickSpec {
    override func spec() {
        describe("HomeCoordinator") {
            
            var spy: NavigationControllerSpy!
            var coordinator: HomeCoordinator!
            
            beforeEach {
                spy = NavigationControllerSpy()
                coordinator = HomeCoordinator(parentViewController: spy)
            }
            
            it("verify if the home screen appears") {
                coordinator.start { }
                expect(spy.isPushViewControllerCalled).to(beTrue())
            }
        }
    }
}
