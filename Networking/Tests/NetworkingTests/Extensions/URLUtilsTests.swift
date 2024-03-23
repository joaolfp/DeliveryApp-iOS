//
//  URLUtilsTests.swift
//
//
//  Created by João Lucas on 23/03/24.
//

import XCTest
@testable import Networking

final class URLUtilsTests: XCTestCase {

    func testUrlValid() {
        guard let validURL = URL(string: "https://example.com") else { return }
        let urlRequest = URLRequest(with: validURL)
        XCTAssertEqual(urlRequest.url, validURL)
    }
}
