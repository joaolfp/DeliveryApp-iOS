//
//  ViewCode.swift
//  
//
//  Created by joao.lucas.f.pereira on 23/03/23.
//

import Foundation

public protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewCode {
    func setupBaseView() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() {
    }
}
