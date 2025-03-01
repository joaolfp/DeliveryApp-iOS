//
//  AddressViewControllerTests.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import SnapshotTesting
import TestUtils
import UIKit
import XCTest
@testable import Address

final class AddressViewControllerTests: XCTestCase {

    var sut: AddressViewController!
    var mock: AddressViewModelMock!

    override func setUp() {
        super.setUp()

        mock = AddressViewModelMock(stateMock: .success)
    }

    override func tearDown() {
        super.tearDown()

        mock = nil
    }

    func testShouldValidateLayoutWithLoading() {
        sut = AddressViewController()
        let navigation = UINavigationController(rootViewController: sut)

        assertSnapshot(of: navigation, as: .image, record: false)
    }

    func testShouldValidateLayoutWithSuccess() {
        sut = AddressViewController(viewModel: mock)
        let navigation = UINavigationController(rootViewController: sut)

        assertSnapshot(of: navigation, as: .image, record: false)
    }

    func testValidateLayoutWithFailure() {
        sut = AddressViewController(viewModel: AddressViewModelMock(stateMock: .failure))
        let navigation = UINavigationController(rootViewController: sut)

        assertSnapshot(of: navigation, as: .image, record: false)
    }
}
