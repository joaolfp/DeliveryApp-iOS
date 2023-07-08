//
//  Coordinator.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import UIKit

public protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    func start(with navigationType: NavigationTypes) -> UIViewController
}

public enum NavigationTypes {
    case push
    case root
    case present(_ completion: (() -> Void)? = nil)
}

extension Coordinator {
    
    public func show(_ viewController: UIViewController, with transition: NavigationTypes, animated: Bool = true) {
        currentViewController = viewController
        
        switch transition {
        case .push:
            push(viewController: viewController, animated: animated)
        case .root:
            root(viewController: viewController, animated: animated)
        case .present(let completion):
            present(viewController: viewController, animated: animated, completion: completion)
        }
    }
    
    private func push(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    private func root(viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: animated)
    }
    
    private func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
}
