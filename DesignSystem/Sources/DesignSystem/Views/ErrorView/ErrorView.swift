//
//  ErrorView.swift
//  
//
//  Created by João Lucas on 09/07/23.
//

import UIKit
import Core

final public class ErrorView: UIView {
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIAssets.Error.error.image
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 200),
            iconImage.heightAnchor.constraint(equalToConstant: 200),
            
            messageLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 16),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func configureViews() {
        backgroundColor = .white
    }
}
