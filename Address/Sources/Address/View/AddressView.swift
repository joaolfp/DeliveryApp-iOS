//
//  AddressView.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core

final class AddressView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddressView: ViewCode {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
