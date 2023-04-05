//
//  HomeCoordinatorTests.swift
//  
//
//  Created by joao.lucas.f.pereira on 05/04/23.
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
                coordinator = HomeCoordinator(navigationController: spy)
            }
            
            it("verify if the home screen appears") {
                coordinator.start(with: .push)
                expect(spy.isPushViewControllerCalled).to(beTrue())
            }
        }
    }
}
