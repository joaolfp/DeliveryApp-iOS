//
//  RestaurantCell.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import Core
import UIKit
import SketchKit

final class RestaurantsCell: UITableViewCell, Identifiable {
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        contentView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        nameLabel.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            view.centerYAnchor(equalTo: contentView.centerYAnchor)
        }
    }
    
    func configureViews() {
        accessoryType = .disclosureIndicator
    }
}
