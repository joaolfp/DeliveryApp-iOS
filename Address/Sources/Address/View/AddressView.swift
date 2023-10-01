//
//  AddressView.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core
import SketchKit

final class AddressView: UIView {
    
    private var dataSource: AddressDataSource?
    
    private let listTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(cellType: AddressCell.self)
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
    
    func setup() {
        dataSource = AddressDataSource()
        
        listTableView.dataSource = dataSource
        listTableView.delegate = dataSource
        listTableView.reloadData()
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
