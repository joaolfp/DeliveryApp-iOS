//
//  UIViewController+AddView.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import Foundation
import SwiftUI
import UIKit

public extension UIViewController {

    func addSwiftUIView(_ swiftUIView: some View, to view: UIView) {
        let hostingController = UIHostingController(rootView: swiftUIView)

        addChild(hostingController)

        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        hostingController.didMove(toParent: self)
    }
}
