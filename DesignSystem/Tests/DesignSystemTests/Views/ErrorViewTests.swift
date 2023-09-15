//
//  ErrorViewTests.swift
//  
//
//  Created by João Lucas on 09/07/23.
//

import SnapshotTesting
import XCTest
import UIKit
@testable import DesignSystem

final class ErrorViewTests: XCTestCase {
    
    func testShouldValidateLayout() {
        let cgRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let view = ErrorView(frame: cgRect, message: "Erro de conexão")
        assertSnapshot(of: view, as: .image)
    }
}
