//
//  AddressCoordinator.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import TestUtils
import UIKit
import XCTest
@testable import Address

final class AddressCoordinatorTests: XCTestCase {

    var spy: NavigationControllerSpy!
    var coordinator: AddressCoordinator!

    override func setUp() {
        super.setUp()

        spy = NavigationControllerSpy()
        coordinator = AddressCoordinator(parentCoordinator: nil, parentViewController: spy)
    }

    override func tearDown() {
        super.tearDown()

        spy = nil
        coordinator = nil
    }

    func testVerifyIfTheHomeScreenAppears() {
        coordinator.start {}
        XCTAssertTrue(spy.isPushViewControllerCalled)
    }
}
