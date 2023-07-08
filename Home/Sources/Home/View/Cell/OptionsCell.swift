//
//  File.swift
//  
//
//  Created by joao.lucas.f.pereira on 05/04/23.
//

import UIKit
import Core
import DesignSystem

final class OptionsCell: UICollectionViewCell, Identifiable {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIAssets.Home.pizza.image
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(text: String) {
        self.textLabel.text = text
    }
}

extension OptionsCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(logoImage)
        contentView.addSubview(textLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
            textLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
