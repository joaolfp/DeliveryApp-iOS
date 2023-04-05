//
//  OptionsDataSource.swift
//  
//
//  Created by joao.lucas.f.pereira on 05/04/23.
//

import UIKit
import Core

final class OptionsDataSource: NSObject, UICollectionViewDataSource {
    
    var data: [RestaurantsDTO]
    
    init(data: [RestaurantsDTO]) {
        self.data = data
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.addCell(for: indexPath, cellType: OptionsCell.self)
        cell.setup(text: data[indexPath.row].category)
        return cell
    }
}

extension OptionsDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
}
