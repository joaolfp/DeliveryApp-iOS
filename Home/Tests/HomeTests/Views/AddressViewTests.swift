//
//  AddressViewTests.swift
//  
//
//  Created by joao.lucas.f.pereira on 26/03/23.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
@testable import Home

final class AddressViewTests: QuickSpec {
    override func spec() {
        describe("AddressView") {
            
            it("should validate layout") {
                let view = AddressView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
                expect(view) == snapshot()
            }
        }
    }
}
