//
//  HomeCoordinator.swift
//
//
//  Created by João Lucas on 25/03/23.
//

import Coordinator
import UIKit

public final class HomeCoordinator: BaseCoordinator {

    private weak var parentViewController: UINavigationController?

    public init(parentCoordinator: CoordinatorProtocol?,
                parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
        super.init(parentCoordinator: parentCoordinator)
    }

    override public func start(_ completion: @escaping () -> Void) {
        let controller = HomeViewController()
        controller.coordinator = self
        parentViewController?.pushViewController(controller, animated: true)
    }

    override public func handle(event: CoordinatorEvent) {
        if let homeEvent = event as? HomeCoordinatorEvent {
            handle(homeEvent)
        }
    }
}

private extension HomeCoordinator {
    func handle(_ event: HomeCoordinatorEvent) {
        switch event {
        case .goToAddress:
            parentCoordinator?.handle(event: HomeExternalCoordinatorEvent.goToAddress)
        }
    }
}
