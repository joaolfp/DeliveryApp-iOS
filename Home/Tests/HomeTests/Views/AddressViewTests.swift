//
//  AddressViewTests.swift
//
//
//  Created by João Lucas on 26/03/23.
//

@testable import Home
import SnapshotTesting
import UIKit
import XCTest

final class AddressViewTests: XCTestCase {

    func testShouldValidateLayout() {
        let view = AddressView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        view.setup(address: L10n.setupAddress)
        assertSnapshot(of: view, as: .image)
    }
}
