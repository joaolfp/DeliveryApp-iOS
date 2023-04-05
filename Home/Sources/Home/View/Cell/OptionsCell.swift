//
//  File.swift
//  
//
//  Created by joao.lucas.f.pereira on 05/04/23.
//

import UIKit
import Core
import SketchKit
import DesignSystem

final class OptionsCell: UICollectionViewCell, Identifiable {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIAssets.Home.pizza.image
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let textLabel: UILabel = {
        var label = UILabel()
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
