//
//  AddressCell.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core
import SketchKit

final class AddressCell: UITableViewCell, Identifiable {
    
    private let streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Rua benedito, 300"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.text = "Consoloção"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16)
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
    
    func setup(street: String, neighborhood: String) {
        streetLabel.text = street
        neighborhoodLabel.text = neighborhood
    }
}

extension AddressCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(streetLabel)
        contentView.addSubview(neighborhoodLabel)
    }
    
    func setupConstraints() {
        streetLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: contentView.topAnchor, constant: 16)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
        }
        
        neighborhoodLabel.layout.applyConstraint { view in
            view.topAnchor(equalTo: streetLabel.bottomAnchor, constant: 8)
            view.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
            view.bottomAnchor(equalTo: contentView.bottomAnchor, constant: -16)
        }
    }
}
