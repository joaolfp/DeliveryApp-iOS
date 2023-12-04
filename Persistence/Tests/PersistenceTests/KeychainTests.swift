//
//  KeychainTests.swift
//
//
//  Created by João Lucas on 17/11/23.
//

@testable import Persistence
import XCTest

final class KeychainTests: XCTestCase {

    var spy: KeychainSpy!

    override func setUp() {
        super.setUp()

        spy = KeychainSpy()
    }

    override func tearDown() {
        super.tearDown()
        spy = nil
    }

    func testVerifySetValueWithSuccess() {
        spy.setValue(value: "token", forKey: .address)
        XCTAssertTrue(spy.isSetValue)
    }

    func testVerifyStandardValueWithSuccess() {
        spy.setValue(value: "token", forKey: .address)
        let value = spy.getValue(forKey: .address)

        XCTAssertTrue(spy.isGetValue)
        XCTAssertEqual(value, "token")
    }

    func testVerifyRemoveValueWithSuccess() {
        spy.setValue(value: "token", forKey: .address)
        spy.removeValue(forKey: .address)
        XCTAssertTrue(spy.isRemoveValue)
    }
}
