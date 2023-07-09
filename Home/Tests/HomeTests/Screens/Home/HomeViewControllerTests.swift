//
//  HomeViewControllerTests.swift
//  
//
//  Created by João Lucas on 26/03/23.
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
            var mock: HomeViewModelMock!
            let window = UIWindow.framed()

            beforeEach {
                mock = HomeViewModelMock(stateMock: .success)
            }

            afterEach {
                window.cleanTestWindow()
            }

            it("should validate layout with success") {
                sut = HomeViewController(viewModel: mock)
                let navigation = UINavigationController(rootViewController: sut)
                window.showTestWindow(controller: navigation)

                expect(navigation).to(haveValidSnapshot())
            }
            
            it("should validate layout with failure") {
                sut = HomeViewController(viewModel: HomeViewModelMock(stateMock: .failure))
                window.showTestWindow(controller: sut)
                
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
