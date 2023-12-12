//
//  AddressDataSource.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Core
import UIKit

protocol AddressDataSourceDelegate: AnyObject {
    func getAddressItem(item: AddressDTO)
}

final class AddressDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    weak var delegate: AddressDataSourceDelegate?

    private var data: [AddressDTO]

    init(data: [AddressDTO]) {
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.addCell(for: indexPath, cellType: AddressCell.self)

        let item = data[indexPath.row]

        cell.setup(street: L10n.street(item.street, item.number), neighborhood: item.neighborhood) {
            self.delegate?.getAddressItem(item: item)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
