//
//  AuthenticationViewTests.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import XCTest
import SnapshotTesting
import TestUtils
@testable import Authentication

final class AuthenticationViewTests: XCTestCase {

    func testShouldValidateLayout() throws {
        let authenticationView = AuthenticationView(viewModel: AuthenticationViewModel())
        assertSnapshot(of: authenticationView.view(), as: .image, record: false)
    }
}
