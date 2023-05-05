//
//  MockView.swift
//  
//
//  Created by joao.lucas.f.pereira on 05/05/23.
//

import UIKit
import Core

final class MockView: UIView, ViewCode {
    
    var buildViewHierarchyCalled: Bool = false
    var setupConstraintsCalled: Bool = false
    var configureViewCalled: Bool = false

    func buildViewHierarchy() {
        buildViewHierarchyCalled = true
    }
    
    func setupConstraints() {
        setupConstraintsCalled = true
    }
    
    func configureView() {
        configureViewCalled = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
