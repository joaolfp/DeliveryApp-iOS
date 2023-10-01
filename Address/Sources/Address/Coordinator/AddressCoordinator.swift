//
//  AddressCoordinator.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core

final public class AddressCoordinator: BaseCoordinator {
    
    private weak var parentViewController: UINavigationController?
    
    public init(parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
    }
    
    public override func start(_ completion: @escaping () -> Void) {
        let controller = AddressViewController()
        controller.coordinator = self
        parentViewController?.pushViewController(controller, animated: true)
    }
}
