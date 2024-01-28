//
//  AppCoordinator.swift
//  DeliveryApp
//
//  Created by João Lucas on 01/10/23.
//

import Address
import Coordinator
import Home
import Authentication
import UIKit

public class AppCoordinator: BaseCoordinator {

    private weak var parentViewController: UINavigationController?

    public init(parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
    }

    override public func start(_ completion: @escaping () -> Void) {
        guard let navigationController = parentViewController else { return }
        startAuthenticationCoordinator(navigationController: navigationController)
        completion()
    }

    override public func handle(event: CoordinatorEvent) {
        if let homeEvent = event as? HomeExternalCoordinatorEvent {
            handle(homeEvent)
        }
        
        if let authenticationEvent = event as? AuthenticationExternalCoordinatorEvent {
            handle(authenticationEvent)
        }
    }
}

private extension AppCoordinator {
    
    func startAuthenticationCoordinator(navigationController: UINavigationController) {
        let coordinator = AuthenticationCoordinator(
            parentCoordinator: self,
            parentViewController: navigationController)
        
        coordinator.start {}
    }

    func startHomeCoordinator(navigationController: UINavigationController) {
        let coordinator = HomeCoordinator(
            parentCoordinator: self,
            parentViewController: navigationController
        )

        coordinator.start {}
    }

    func startAddressCoordinator(navigationController: UINavigationController) {
        let coordinator = AddressCoordinator(
            parentCoordinator: self,
            parentViewController: navigationController
        )

        coordinator.start {}
    }
}

private extension AppCoordinator {
    func handle(_ event: HomeExternalCoordinatorEvent) {
        switch event {
        case .goToAddress:
            guard let navigationController = parentViewController else { return }
            startAddressCoordinator(navigationController: navigationController)
        }
    }
    
    func handle(_ event: AuthenticationExternalCoordinatorEvent) {
        switch event {
        case .goToHome:
            guard let navigationController = parentViewController else { return }
            startHomeCoordinator(navigationController: navigationController)
        }
    }
}
