//
//  HomeView.swift
//  
//
//  Created by João Lucas on 23/03/23.
//

import UIKit
import Core
import DesignSystem

final class HomeView: UIView {
    
    private let scrollStackView: ScrollStackView = {
        let view = ScrollStackView(topInset: 0, bottomInset: 4)
        view.scrollView.backgroundColor = .lightGray
        view.scrollView.bounces = false
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .gray
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

extension HomeView {
    func isLoading(_ isBool: Bool) {
        if isBool == true {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

}

extension HomeView: ViewCode {
    func buildViewHierarchy() {
        addSubview(scrollStackView)
        scrollStackView.addSubview(activityIndicator)
        
        scrollStackView.stackView.addArrangedSubview(addressView)
        scrollStackView.stackView.addArrangedSubview(optionsView)
        scrollStackView.stackView.addArrangedSubview(restaurantView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollStackView.topAnchor.constraint(equalTo: topAnchor),
            scrollStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: scrollStackView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: scrollStackView.centerYAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
