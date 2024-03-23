//
//  APIParametersTests.swift
//  
//
//  Created by João Lucas on 23/03/24.
//

import XCTest
@testable import Networking

final class APIParametersTests: XCTestCase {

    func testItemsEmptyParameters() {
        let queryParameters: APIParameters = [:]
        let items = queryParameters.queryItems
        XCTAssertTrue(items.isEmpty, "Items array should be empty for empty query parameters.")
    }

    func testItemsSingleParameter() {
        let queryParameters: APIParameters = ["key": "value"]

        let items = queryParameters.queryItems

        XCTAssertEqual(items.count, 1, "Items array should contain one item for a single parameter")
        XCTAssertEqual(items.first?.name, "key", "Item name should be 'key'")
        XCTAssertEqual(items.first?.value, "value", "Item value should be 'value'")
    }

    func testItemsMultipleParameters() {
        let queryParameters: APIParameters = [
            "key_one": "value1",
            "key_two": "value2",
            "key_three": "value3"
        ]

        let items = queryParameters.queryItems

        XCTAssertEqual(items.count, 3, "Items array should contain three items for multiple parameters")
        XCTAssertTrue(items.contains { $0.name == "key_one" && $0.value == "value1" }, "Item for key_one should exist")
        XCTAssertTrue(items.contains { $0.name == "key_two" && $0.value == "value2" }, "Item for key_two should exist")
        XCTAssertTrue(items.contains { $0.name == "key_three" && $0.value == "value3" }, "Item for key_three should exist")
    }
}
