//
//  HomeCoordinatorTests.swift
//  
//
//  Created by João Lucas on 05/04/23.
//

import XCTest
import UIKit
import TestUtils
@testable import Home

final class HomeCoordinatorTests: XCTestCase {
    
    var spy: NavigationControllerSpy!
    var coordinator: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        
        spy = NavigationControllerSpy()
        coordinator = HomeCoordinator(parentViewController: spy)
    }
    
    override func tearDown() {
        super.tearDown()
        
        spy = nil
        coordinator = nil
    }
    
    func testVerifyIfTheHomeScreenAppears() {
        coordinator.start { }
        XCTAssertTrue(spy.isPushViewControllerCalled)
    }
}
