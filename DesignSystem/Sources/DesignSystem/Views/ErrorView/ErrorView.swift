//
//  ErrorView.swift
//
//
//  Created by João Lucas on 09/07/23.
//

import Core
import MagicImages
import SketchKit
import UIKit

public final class ErrorView: UIView {

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    public init(frame: CGRect = .zero, message: String) {
        super.init(frame: frame)

        messageLabel.text = message

        setupBaseView()

        MagicImages(image: iconImage).start(uiImage: UIAssets.Error.error.image)
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
