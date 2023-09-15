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
        
        mock = HomeViewModelMock(stateMock: .success)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mock = nil
    }
    
    func testShouldValidateLayoutWithSuccess() {
        sut = HomeViewController(viewModel: mock)
        assertSnapshot(of: sut, as: .image(on: .iPhone13))
    }
    
    func testValidateLayoutWithFailure() {
        sut = HomeViewController(viewModel: HomeViewModelMock(stateMock: .failure))
        assertSnapshot(of: sut, as: .image(on: .iPhone13))
    }
    
}
