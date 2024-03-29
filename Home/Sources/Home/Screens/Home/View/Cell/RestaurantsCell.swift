//
//  RestaurantsCell.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import Core
import DesignSystem
import MagicImages
import SketchKit
import UIKit

final class RestaurantsCell: UITableViewCell, Identifiable {

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBaseView()

        MagicImages(image: logoImage)
            .start(uiImage: UIAssets.Home.restaurantLogo.image)
            .isCircle(measure: 50)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RestaurantsCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(logoImage)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }

    func setupConstraints() {
        logoImage.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
        }

        stackView.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: logoImage.trailingAnchor, constant: 16)
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
        }
    }

    func configureViews() {
        accessoryType = .disclosureIndicator
        backgroundColor = .white
    }
}
