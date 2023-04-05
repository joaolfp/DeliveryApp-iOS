//
//  RestaurantCell.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import Core
import UIKit
import SketchKit
import DesignSystem

final class RestaurantsCell: UITableViewCell, Identifiable {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIAssets.Home.restaurant.image
        imageView.layer.cornerRadius = 50/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        var label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBaseView()
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
            view.widthAnchor(equalToConstant: 50)
            view.heightAnchor(equalToConstant: 50)
        }
        
        stackView.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: logoImage.trailingAnchor, constant: 16)
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
        }
    }
    
    func configureViews() {
        accessoryType = .disclosureIndicator
    }
}
