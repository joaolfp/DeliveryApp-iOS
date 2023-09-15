//
//  HomeViewControllerTests.swift
//  
//
//  Created by João Lucas on 26/03/23.
//

import SnapshotTesting
import XCTest
import UIKit
import TestUtils
@testable import Home

final class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var mock: HomeViewModelMock!
    let window = UIWindow.framed()
    
    override func setUp() {
        super.setUp()
        
        mock = HomeViewModelMock(stateMock: .success)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mock = nil
        window.cleanTestWindow()
    }
    
    func testShouldValidateLayoutWithSuccess() {
        sut = HomeViewController(viewModel: mock)
        let navigation = UINavigationController(rootViewController: sut)
        window.showTestWindow(controller: navigation)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
    func testValidateLayoutWithFailure() {
        sut = HomeViewController(viewModel: HomeViewModelMock(stateMock: .failure))
        let navigation = UINavigationController(rootViewController: sut)
        window.showTestWindow(controller: navigation)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
}
