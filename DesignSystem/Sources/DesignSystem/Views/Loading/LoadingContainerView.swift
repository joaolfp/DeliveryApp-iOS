//
//  LoadingContainerView.swift
//
//
//  Created by João Lucas on 28/09/23.
//

import UIKit
import Core
import SketchKit

final public class LoadingContainerView: UIView {
    
    public enum Status {
        case loading
        case showView
    }
    
    private let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .gray
        view.startAnimating()
        return view
    }()

    private let containerView: UIView
    
    public var status: Status = .loading {
        didSet {
            self.updateView(from: self.status)
        }
    }
    
    public init(containerView: UIView) {
        self.containerView = containerView
        super.init(frame: .zero)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required public init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView(from status: Status) {
        let targetView: UIView
        switch status {
        case .loading:
            targetView = self.loadingView
        case .showView:
            targetView = self.containerView
        }
        
        self.addSubview(targetView)
        
        targetView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
        }
    }
}

extension LoadingContainerView: ViewCode {
    public func buildViewHierarchy() {
        addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
    }
    
    public func setupConstraints() {
        loadingView.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor)
            view.leadingAnchor(equalTo: leadingAnchor)
            view.trailingAnchor(equalTo: trailingAnchor)
            view.bottomAnchor(equalTo: bottomAnchor)
        }
        
        activityIndicator.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: loadingView.centerXAnchor)
            view.centerYAnchor(equalTo: loadingView.centerYAnchor)
        }
    }
}
