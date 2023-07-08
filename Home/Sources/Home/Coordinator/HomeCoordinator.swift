//
//  HomeCoordinator.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import UIKit
import Core

final public class HomeCoordinator: BaseCoordinator {
    
    private weak var parentViewController: UINavigationController?
    
    public init(parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
    }
    
    public override func start(_ completion: @escaping () -> Void) {
        let controller = HomeViewController()
        controller.coordinator = self
        parentViewController?.pushViewController(controller, animated: true)
    }
}
