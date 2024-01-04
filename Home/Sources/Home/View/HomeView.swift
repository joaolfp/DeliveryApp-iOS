//
//  HomeView.swift
//
//
//  Created by João Lucas on 23/03/23.
//

import Core
import DesignSystem
import SketchKit
import UIKit

protocol HomeViewDelegate: AnyObject {
    func goToAddress()
}

final class HomeView: UIView {

    weak var delegate: HomeViewDelegate?

    private lazy var scrollStackView: ScrollStackView = {
        let view = ScrollStackView(topInset: 0, bottomInset: 4)
        view.scrollView.backgroundColor = .lightGray
        view.scrollView.bounces = false
        return view
    }()

    lazy var addressView: AddressView = {
        let view = AddressView()
        view.delegate = self
        return view
    }()

    lazy var optionsView: OptionsView = {
        let view = OptionsView()
        return view
    }()

    lazy var restaurantView: RestaurantView = {
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

extension HomeView: AddressViewDelegate {
    func addressTap() {
        delegate?.goToAddress()
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
