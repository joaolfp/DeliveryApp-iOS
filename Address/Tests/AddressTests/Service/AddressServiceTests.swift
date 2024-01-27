//
//  AddressServiceTests.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Networking
import TestUtils
import XCTest
@testable import Address

final class AddressServiceTests: XCTestCase {

    var sut: AddressService!
    var mock: APIClientMock!

    override func setUp() {
        super.setUp()

        mock = APIClientMock()
        sut = AddressService(client: mock)
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        mock = nil
    }

    func testVerifyAddressListWithSuccess() {
        mock.fileJson = "AddressList"
        mock.module = "Address"

        sut.getAddressList { result in
            switch result {
            case let .success(address):
                XCTAssertEqual(address[0].street, "Rua Augusta")
                XCTAssertEqual(address[0].number, "495")
                XCTAssertEqual(address[0].neighborhood, "Consolação")
            case let .failure(error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
