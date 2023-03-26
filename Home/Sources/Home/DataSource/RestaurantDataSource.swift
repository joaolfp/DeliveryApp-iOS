//
//  RestaurantDataSource.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import UIKit
import Core
import DesignSystem

final class RestaurantsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var data: [RestaurantsDTO]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.addCell(for: indexPath, cellType: RestaurantsCell.self)
        
        cell.nameLabel.text = data?[indexPath.row].name
        
        let min = data?[indexPath.row].deliveryTime.min ?? 0
        let max = data?[indexPath.row].deliveryTime.max ?? 0
        cell.descriptionLabel.text = "Padaria . \(min)-\(max) min"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
