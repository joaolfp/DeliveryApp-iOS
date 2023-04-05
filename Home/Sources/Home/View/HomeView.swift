//
//  HomeView.swift
//  
//
//  Created by joao.lucas.f.pereira on 23/03/23.
//

import UIKit
import Core
import DesignSystem
import SketchKit

final class HomeView: UIView {
    
    private let scrollStackView: ScrollStackView = {
        let view = ScrollStackView(topInset: 0, bottomInset: 4)
        view.scrollView.backgroundColor = .lightGray
        return view
    }()
    
    let addressView: AddressView = {
        let view = AddressView()
        return view
    }()
    
    let optionsView: OptionsView = {
        let view = OptionsView()
        return view
    }()
    
    let restaurantView: RestaurantView = {
        let view = RestaurantView()
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    func buildViewHierarchy() {
        addSubview(scrollStackView)
        scrollStackView.stackView.addArrangedSubview(addressView)
        scrollStackView.stackView.addArrangedSubview(optionsView)
        scrollStackView.stackView.addArrangedSubview(restaurantView)
    }
    
    func setupConstraints() {
        scrollStackView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
        }
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
