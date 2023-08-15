//
//  OptionsView.swift
//  
//
//  Created by João Lucas on 24/03/23.
//

import UIKit
import Core
import SketchKit

final class OptionsView: UIView {
    
    private var dataSource: OptionsDataSource?
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let collectionsView: UICollectionView = {
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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
        cardView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 2)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
            view.heightAnchor(equalToConstant: 100)
        }
        
        collectionsView.layout.applyConstraint { view in
            view.topAnchor(equalTo: cardView.topAnchor)
            view.leadingAnchor(equalTo: cardView.leadingAnchor)
            view.trailingAnchor(equalTo: cardView.trailingAnchor)
            view.bottomAnchor(equalTo: cardView.bottomAnchor)
        }
    }
}
