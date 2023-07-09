//
//  RestaurantView.swift
//  
//
//  Created by João Lucas on 24/03/23.
//

import UIKit
import Core

final class RestaurantView: UIView {
    
    private var dataSource: RestaurantsDataSource?
    
    private lazy var heightTableView = self.getHeightTableView()
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        dataSource = RestaurantsDataSource(data: data)
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
        
        cardView.heightAnchor.constraint(equalToConstant: self.heightTableView).isActive = true
    }
}

extension RestaurantView {
    
    private func getHeightTableView() -> CGFloat {
        return (80 * CGFloat(dataSource?.data.count ?? 0))
    }
}

extension RestaurantView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: cardView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
}
