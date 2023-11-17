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
    
    override func setUp() {
        super.setUp()
        
        mock = HomeViewModelMock(stateMock: .success, statePersistence: .withValue)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mock = nil
    }
    
    func testShouldValidateLayoutWithLoading() {
        sut = HomeViewController()
        let navigation = UINavigationController(rootViewController: sut)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
    func testShouldValidateLayoutWithSuccess() {
        sut = HomeViewController(viewModel: mock)
        let navigation = UINavigationController(rootViewController: sut)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
    func testValidateLayoutWithFailure() {
        sut = HomeViewController(viewModel: HomeViewModelMock(stateMock: .failure, statePersistence: .withValue))
        let navigation = UINavigationController(rootViewController: sut)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
    func testShouldValidateLayoutWithoutAddress() {
        let mock = HomeViewModelMock(stateMock: .success, statePersistence: .withoutValue)
        sut = HomeViewController(viewModel: mock)
        let navigation = UINavigationController(rootViewController: sut)
        
        assertSnapshot(of: navigation, as: .image)
    }
    
}
