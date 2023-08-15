//
//  ErrorView.swift
//  
//
//  Created by João Lucas on 09/07/23.
//

import UIKit
import Core
import SketchKit

final public class ErrorView: UIView {
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIAssets.Error.error.image
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public init(frame: CGRect = .zero, message: String) {
        self.messageLabel.text = message
        super.init(frame: frame)
        
        setupBaseView()
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ErrorView: ViewCode {
    public func buildViewHierarchy() {
        addSubview(iconImage)
        addSubview(messageLabel)
    }
    
    public func setupConstraints() {
        iconImage.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: centerXAnchor)
            view.centerYAnchor(equalTo: centerYAnchor)
            view.widthAnchor(equalToConstant: 200)
            view.heightAnchor(equalToConstant: 200)
        }
        
        messageLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: iconImage.bottomAnchor, constant: 16)
            view.centerXAnchor(equalTo: centerXAnchor)
        }
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
