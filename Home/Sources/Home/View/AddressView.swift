//
//  AddressView.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import UIKit
import Core
import SketchKit

final class AddressView: UIView {
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "R. Guirantiga, 500"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
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

extension AddressView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(addressLabel)
    }
    
    func setupConstraints() {
        cardView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 2)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
        }
        
        addressLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: cardView.topAnchor, constant: 16)
            view.leadingAnchor(equalTo: cardView.leadingAnchor, constant: 16)
            view.bottomAnchor(equalTo: cardView.bottomAnchor, constant: -16)
        }
    }
}
