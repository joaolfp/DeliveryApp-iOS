//
//  RestaurantCellTests.swift
//
//
//  Created by João Lucas on 27/01/24.
//

import SnapshotTesting
import UIKit
import XCTest
@testable import Home

final class RestaurantCellTests: XCTestCase {

    func testShouldValidateLayout() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let cell = RestaurantsCell(frame: frame)
        cell.nameLabel.text = "Bar do alemão"
        cell.descriptionLabel.text = "Padaria . 38-48 min"

        assertSnapshot(of: cell, as: .image, record: false)
    }
}
