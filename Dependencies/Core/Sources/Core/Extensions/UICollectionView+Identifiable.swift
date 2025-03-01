//
//  UICollectionView+Identifiable.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import UIKit

public extension UICollectionView {

    func registerCell(cellType: (some UICollectionViewCell & Identifiable).Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    func addCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Identifiable {
        let getCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
        guard let cell = getCell as? T else {
            fatalError(
                "Failed cell with identifier \(cellType.reuseIdentifier)"
            )
        }
        return cell
    }
}
