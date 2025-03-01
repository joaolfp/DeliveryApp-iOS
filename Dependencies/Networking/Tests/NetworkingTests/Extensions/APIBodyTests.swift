//
//  APIBodyTests.swift
//
//
//  Created by João Lucas on 23/03/24.
//

import XCTest
@testable import Networking

final class APIBodyTests: XCTestCase {

    func testDataEncoded() {
        let body: APIBody = ["key": "value"]
        let data = body.dataEncoded
        XCTAssertNotNil(data, "Encoded data should not be nil")

        if let data {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                XCTAssertTrue(jsonObject is [String: Any], "Encoded data should be a dictionary")
            } catch {
                XCTFail("Error decoding the encoded data: \(error)")
            }
        }
    }
}
