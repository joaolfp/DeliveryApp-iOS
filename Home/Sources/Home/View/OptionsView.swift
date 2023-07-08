//
//  OptionsView.swift
//  
//
//  Created by João Lucas on 24/03/23.
//

import UIKit
import Core

final class OptionsView: UIView {
    
    private var dataSource: OptionsDataSource?
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let collectionsView: UICollectionView = {
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.registerCell(cellType: OptionsCell.self)
        return collection
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
        dataSource = OptionsDataSource(data: data)
        
        collectionsView.dataSource = dataSource
        collectionsView.delegate = dataSource
        collectionsView.reloadData()
    }
}

extension OptionsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
        cardView.addSubview(collectionsView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 100),
            
            collectionsView.topAnchor.constraint(equalTo: cardView.topAnchor),
            collectionsView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            collectionsView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            collectionsView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
    }
}
