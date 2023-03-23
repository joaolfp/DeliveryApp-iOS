//
//  File.swift
//  
//
//  Created by joao.lucas.f.pereira on 23/03/23.
//

import UIKit
import Core
import DesignSystem
import SketchKit

final class HomeView: UIView {
    
    private var scrollStackView: ScrollStackView = {
        let view = ScrollStackView(topInset: 0, botInset: 16)
        view.scrollView.backgroundColor = .blue
        return view
    }()
    
    private var cardView: HomeCardView = {
        let view = HomeCardView()
        return view
    }()
    
    private var cardView2: HomeCardView = {
        let view = HomeCardView()
        return view
    }()
    
    private var cardView3: HomeCardView = {
        let view = HomeCardView()
        return view
    }()
    
    private var cardView4: HomeCardView = {
        let view = HomeCardView()
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
        scrollStackView.stackView.addArrangedSubview(cardView)
        scrollStackView.stackView.addArrangedSubview(cardView2)
        scrollStackView.stackView.addArrangedSubview(cardView3)
        scrollStackView.stackView.addArrangedSubview(cardView4)
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

final class HomeCardView: UIView {
    
    private var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
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

extension HomeCardView: ViewCode {
    func buildViewHierarchy() {
        addSubview(cardView)
    }
    
    func setupConstraints() {
        cardView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 16)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -16)
            view.heightAnchor(equalToConstant: 200)
        }
    }
}
