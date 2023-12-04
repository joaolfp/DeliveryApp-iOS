//
//  AddressCell.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Core
import SketchKit
import UIKit

final class AddressCell: UITableViewCell, Identifiable {

    private var tapView: (() -> Void)?

    private let streetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBaseView()
        setupGesture()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(street: String, neighborhood: String, action: (() -> Void)?) {
        streetLabel.text = street
        neighborhoodLabel.text = neighborhood

        tapView = action
    }

    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
    }

    @objc
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        tapView?()
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
        }
    }
}
