//
//  LoadingContainerView.swift
//
//
//  Created by João Lucas on 28/09/23.
//

import Core
import SketchKit
import UIKit

public final class LoadingContainerView: UIView {

    public enum Status {
        case loading
        case showView
        case showError
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
    private let errorView: UIView

    public var status: Status = .loading {
        didSet {
            updateView(from: status)
        }
    }

    public init(containerView: UIView, errorView: UIView) {
        self.containerView = containerView
        self.errorView = errorView
        super.init(frame: .zero)
        setupBaseView()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateView(from status: Status) {
        let targetView: UIView
        switch status {
        case .loading:
            targetView = loadingView
        case .showView:
            targetView = containerView
        case .showError:
            targetView = errorView
        }

        addSubview(targetView)

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
