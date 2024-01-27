//
//  UITableView+Identifiable.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import UIKit

public extension UITableView {

    func registerCell(cellType: (some UITableViewCell & Identifiable).Type) {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    func addCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}
