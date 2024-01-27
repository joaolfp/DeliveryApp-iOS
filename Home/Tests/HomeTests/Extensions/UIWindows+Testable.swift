//
//  UIWindows+Testable.swift
//
//
//  Created by João Lucas on 26/03/23.
//

import UIKit

extension UIWindow {

    static func framed(frame: CGRect = CGRect(x: 0, y: 0, width: 375, height: 812)) -> UIWindow {
        UIWindow(frame: frame)
    }

    func showTestWindow(controller: UIViewController) {
        rootViewController = controller
        makeKeyAndVisible()
    }

    func cleanTestWindow() {
        rootViewController = nil
        isHidden = true
    }
}
