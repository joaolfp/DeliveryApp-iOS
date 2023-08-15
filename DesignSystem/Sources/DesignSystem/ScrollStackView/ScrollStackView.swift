//
//  ScrollStackView.swift
//  
//
//  Created by João Lucas on 23/03/23.
//

import UIKit
import Core
import SketchKit

open class ScrollStackView: UIView {
    
    private let topInset: CGFloat
    private let bottomInset: CGFloat
    
    public let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isDirectionalLockEnabled = true
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    public let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    public init(topInset: CGFloat = 0, bottomInset: CGFloat = 0) {
        self.topInset = topInset
        self.bottomInset = bottomInset
        super.init(frame: .zero)
        setupBaseView()
    }
    
    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScrollStackView: ViewCode {
    
    public func buildViewHierarchy() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
    }
    
    public func setupConstraints() {
        scrollView.layout.applyConstraint { view in
            view.topAnchor(equalTo: safeAreaLayoutGuide.topAnchor)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: safeAreaLayoutGuide.bottomAnchor)
        }
        
        stackView.layout.applyConstraint { view in
            view.topAnchor(equalTo: scrollView.topAnchor, constant: topInset)
            view.leadingAnchor(equalTo: scrollView.leadingAnchor)
            view.trailingAnchor(equalTo: scrollView.trailingAnchor)
            view.bottomAnchor(equalTo: scrollView.bottomAnchor, constant: -bottomInset)
            view.widthAnchor(equalToConstant: UIScreen.main.bounds.width)
        }

    }
    
    public func configureView() {
        self.backgroundColor = .white
    }
}
