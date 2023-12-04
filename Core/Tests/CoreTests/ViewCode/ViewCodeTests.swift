//
//  ViewCodeTests.swift
//
//
//  Created by João Lucas on 05/05/23.
//

@testable import Core
import XCTest

final class ViewCodeTests: XCTestCase {

    var mockView: MockView!

    override func setUp() {
        super.setUp()

        mockView = MockView()
    }

    override func tearDown() {
        super.tearDown()

        mockView = nil
    }

    func testWhenSetupBaseViewWithSuccess() {
        XCTAssertTrue(mockView.buildViewHierarchyCalled)
        XCTAssertTrue(mockView.setupConstraintsCalled)
        XCTAssertFalse(mockView.configureViewCalled)
    }
}
