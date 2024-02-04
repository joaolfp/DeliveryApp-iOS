//
//  AddressCellTests.swift
//
//
//  Created by João Lucas on 27/01/24.
//

import SnapshotTesting
import UIKit
import XCTest
@testable import Address

final class AddressCellTests: XCTestCase {

    func testShouldValidateLayout() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let cell = AddressCell(frame: frame)
        cell.setup(street: "Rua Alba, 108", neighborhood: "Parque Jabaquara", action: nil)

        assertSnapshot(of: cell, as: .image)
    }
}
