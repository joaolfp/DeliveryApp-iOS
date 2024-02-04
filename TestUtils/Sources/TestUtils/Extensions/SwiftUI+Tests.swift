//
//  SwiftUI+Tests.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import SwiftUI

public extension View {

    func view(width: CGFloat? = nil, height: CGFloat? = nil, colorScheme: ColorScheme? = nil) -> UIView {
        let viewController = UIHostingController(rootView: environment(\.colorScheme, colorScheme ?? .light))
        viewController._disableSafeArea = true

        let calculatedSize = width.map {
            viewController.view.sizeThatFits(
                CGSize(width: $0, height: height ?? CGFloat.greatestFiniteMagnitude))
        } ?? UIScreen.main.bounds.size

        let window = UIWindow(frame: CGRect(origin: .zero, size: calculatedSize))
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.backgroundColor = colorScheme == .light ? .white : .black
        return viewController.view
    }
}
