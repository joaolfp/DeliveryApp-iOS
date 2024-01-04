//
//  OptionsCell.swift
//
//
//  Created by João Lucas on 05/04/23.
//

import Core
import DesignSystem
import MagicImages
import SketchKit
import UIKit

final class OptionsCell: UICollectionViewCell, Identifiable {

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()

        MagicImages(image: logoImage).start(uiImage: UIAssets.Home.pizza.image)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(text: String) {
        textLabel.text = text
    }
}

extension OptionsCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(logoImage)
        contentView.addSubview(textLabel)
    }

    func setupConstraints() {
        logoImage.layout.applyConstraint { view in
            view.topAnchor(equalTo: contentView.topAnchor)
            view.leadingAnchor(equalTo: contentView.leadingAnchor)
            view.trailingAnchor(equalTo: contentView.trailingAnchor)
            view.heightAnchor(equalToConstant: 60)
        }

        textLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: logoImage.bottomAnchor)
            view.bottomAnchor(equalTo: contentView.bottomAnchor)
            view.centerXAnchor(equalTo: contentView.centerXAnchor)
        }
    }
}
