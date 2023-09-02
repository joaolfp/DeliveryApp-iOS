//
//  ViewCodeTests.swift
//  
//
//  Created by João Lucas on 05/05/23.
//

import Foundation
import Quick
import Nimble
@testable import Core

final class ViewCodeTests: QuickSpec {
    override class func spec() {
        
        it("when setupBaseView with success") {
            let mockView = MockView()
            expect(mockView.buildViewHierarchyCalled).to(beTrue())
            expect(mockView.setupConstraintsCalled).to(beTrue())
            expect(mockView.configureViewCalled).to(beFalse())
        }
        
    }
}
