//
//  AuthenticationCoordinator.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import Coordinator
import UIKit

public final class AuthenticationCoordinator: BaseCoordinator {

    private weak var parentViewController: UINavigationController?

    public init(parentCoordinator: CoordinatorProtocol?,
                parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
        super.init(parentCoordinator: parentCoordinator)
    }

    override public func start(_ completion: @escaping () -> Void) {
        let controller = AuthenticationViewController()
        controller.coordinator = self
        parentViewController?.pushViewController(controller, animated: true)
    }
}
