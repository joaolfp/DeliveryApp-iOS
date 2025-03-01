//
//  RestaurantDataSource.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import Core
import DesignSystem
import UIKit

final class RestaurantsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var data: [RestaurantsDTO]

    init(data: [RestaurantsDTO]) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.addCell(for: indexPath, cellType: RestaurantsCell.self)

        let value = data[indexPath.row]
        cell.nameLabel.text = value.name
        cell.descriptionLabel.text = L10n.restaurantDescription(value.deliveryTime.min, value.deliveryTime.max)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
}
