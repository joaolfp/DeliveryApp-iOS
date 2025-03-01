//
//  AddressCoordinator.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Coordinator
import UIKit

public final class AddressCoordinator: BaseCoordinator {

    private weak var parentViewController: UINavigationController?

    public init(parentCoordinator: CoordinatorProtocol?,
                parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
        super.init(parentCoordinator: parentCoordinator)
    }

    override public func start(_ completion: @escaping () -> Void) {
        let controller = AddressViewController()
        controller.coordinator = self
        parentViewController?.pushViewController(controller, animated: true)
    }

    override public func handle(event: CoordinatorEvent) {
        if let addressEvent = event as? AddressCoordinatorEvent {
            handle(addressEvent)
        }
    }
}

extension AddressCoordinator {

    private func popViewController(animated: Bool) {
        parentViewController?.popViewController(animated: animated)
    }
}

private extension AddressCoordinator {
    func handle(_ event: AddressCoordinatorEvent) {
        switch event {
        case let .popViewController(animated):
            popViewController(animated: animated)
        }
    }
}
