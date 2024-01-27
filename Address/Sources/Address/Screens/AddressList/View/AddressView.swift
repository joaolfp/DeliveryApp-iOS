//
//  AddressView.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Core
import SketchKit
import UIKit

protocol AddressViewDelegate: AnyObject {
    func getAddressSelected(item: AddressDTO)
}

final class AddressView: UIView {

    weak var delegate: AddressViewDelegate?

    private var dataSource: AddressDataSource?

    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: AddressCell.self)
        tableView.backgroundColor = .white
        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupBaseView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(data: [AddressDTO]) {
        dataSource = AddressDataSource(data: data)
        dataSource?.delegate = self

        listTableView.dataSource = dataSource
        listTableView.delegate = dataSource
        listTableView.reloadData()
    }
}

extension AddressView: AddressDataSourceDelegate {
    func getAddressItem(item: AddressDTO) {
        delegate?.getAddressSelected(item: item)
    }
}

extension AddressView: ViewCode {
    func buildViewHierarchy() {
        addSubview(listTableView)
    }

    func setupConstraints() {
        listTableView.layout.applyConstraint { view in
            view.topAnchor(equalTo: safeTopAnchor)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: safeBottomAnchor)
        }
    }

    func configureViews() {
        backgroundColor = .white
    }
}
