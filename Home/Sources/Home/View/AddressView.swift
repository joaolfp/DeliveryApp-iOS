//
//  AddressView.swift
//  
//
//  Created by João Lucas on 24/03/23.
//

import UIKit
import Core
import SketchKit

protocol AddressViewDelegate: AnyObject {
    func addressTap()
}

final class AddressView: UIView {
    
    weak var delegate: AddressViewDelegate?
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.setupAddress.rawValue
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle(Localizable.edit.rawValue, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(addressTap), for: .touchUpInside)
        return button
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

extension AddressView {
    
    @objc
    func addressTap() {
        delegate?.addressTap()
    }
}

extension AddressView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(addressLabel)
        cardView.addSubview(editButton)
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
        
        editButton.layout.applyConstraint { view in
            view.topAnchor(equalTo: cardView.topAnchor, constant: 16)
            view.leadingAnchor(equalTo: addressLabel.trailingAnchor, constant: 16)
            view.widthAnchor(equalToConstant: 80)
            view.bottomAnchor(equalTo: cardView.bottomAnchor, constant: -16)
        }
    }
}
