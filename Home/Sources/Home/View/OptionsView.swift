//
//  OptionsView.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import UIKit
import Core
import SketchKit

final class OptionsView: UIView {
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OptionsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
    }
    
    func setupConstraints() {
        cardView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 2)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
            view.heightAnchor(equalToConstant: 100)
        }
    }
}
