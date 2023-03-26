//
//  RestaurantView.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import UIKit
import Core
import SketchKit

final class RestaurantView: UIView {
    
    private let dataSource = RestaurantsDataSource()
    
    private lazy var heightTableView = self.getHeightTableView()
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.registerCell(cellType: RestaurantsCell.self)
        return tableView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(data: [RestaurantsDTO]) {
        dataSource.data = data
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
        
        cardView.heightAnchor(equalToConstant: self.heightTableView)
    }
}

extension RestaurantView {
    
    private func getHeightTableView() -> CGFloat {
        let count = (80 * CGFloat(dataSource.data?.count ?? 0))
        return (tableView.frame.height / 100) + count
    }
}

extension RestaurantView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(tableView)
    }
    
    func setupConstraints() {
        cardView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 2)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
        }
        
        tableView.layout.applyConstraint { view in
            view.topAnchor(equalTo: cardView.topAnchor)
            view.leadingAnchor(equalTo: cardView.leadingAnchor)
            view.trailingAnchor(equalTo: cardView.trailingAnchor)
            view.bottomAnchor(equalTo: cardView.bottomAnchor)
        }
    }
}
