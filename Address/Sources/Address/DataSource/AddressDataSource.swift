//
//  AddressDataSource.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core

final class AddressDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.addCell(for: indexPath, cellType: AddressCell.self)
        cell.setup(street: "Rua Benedito, 40", neighborhood: "Consoloção")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
