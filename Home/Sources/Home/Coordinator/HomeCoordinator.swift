//
//  HomeCoordinator.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import UIKit
import Core

final public class HomeCoordinator: Coordinator {
    public var currentViewController: UIViewController?
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    public func start(with navigationType: NavigationTypes) -> UIViewController {
        let controller = HomeViewController()
        controller.coordinator = self
        show(controller, with: navigationType)
        return navigationController
    }
}
