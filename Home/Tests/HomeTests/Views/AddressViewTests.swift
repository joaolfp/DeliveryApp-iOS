//
//  AddressViewTests.swift
//  
//
//  Created by João Lucas on 26/03/23.
//

import SnapshotTesting
import XCTest
import UIKit
@testable import Home

final class AddressViewTests: XCTestCase {
    
    func testShouldValidateLayout() {
        let view = AddressView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        assertSnapshot(of: view, as: .image)
    }
}
