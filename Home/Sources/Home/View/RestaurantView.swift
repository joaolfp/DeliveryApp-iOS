//
//  RestaurantView.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import Core
import SketchKit
import UIKit

final class RestaurantView: UIView {

    private var dataSource: RestaurantsDataSource?

    private lazy var heightTableView = self.getHeightTableView()

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var tableView: UITableView = {
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
        dataSource = RestaurantsDataSource(data: data)

        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()

        cardView.heightAnchor.constraint(equalToConstant: heightTableView).isActive = true
    }
}

extension RestaurantView {

    private func getHeightTableView() -> CGFloat {
        80 * CGFloat(dataSource?.data.count ?? 0)
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
