//
//  OptionsCellTests.swift
//
//
//  Created by João Lucas on 27/01/24.
//

import SnapshotTesting
import UIKit
import XCTest
@testable import Home

final class OptionsCellTests: XCTestCase {

    func testShouldValidateLayout() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let cell = OptionsCell(frame: frame)
        cell.backgroundColor = .white
        cell.setup(text: "Padaria")

        assertSnapshot(of: cell, as: .image, record: false)
    }
}
