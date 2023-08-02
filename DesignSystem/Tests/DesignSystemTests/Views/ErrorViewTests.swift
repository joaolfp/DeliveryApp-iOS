//
//  ErrorViewTests.swift
//  
//
//  Created by João Lucas on 09/07/23.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
@testable import DesignSystem

final class ErrorViewTests: QuickSpec {
    override func spec() {
        describe("ErrorView") {
            
            it("should validate layout") {
                let cgRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                let view = ErrorView(frame: cgRect, message: "Erro de conexão")
                expect(view).to(haveValidSnapshot(tolerance: 0.02))
            }
        }
    }
}
