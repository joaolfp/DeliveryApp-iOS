//
//  AppCoordinator.swift
//  DeliveryApp
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core
import Home
import Address

public class AppCoordinator: BaseCoordinator {
    
    private weak var parentViewController: UINavigationController?
    
    public init(parentViewController: UINavigationController?) {
        self.parentViewController = parentViewController
    }
    
    public override func start(_ completion: @escaping () -> Void) {
        guard let navigationController = parentViewController else { return }
        startHomeCoordinator(navigationController: navigationController)
        completion()
    }
    
    override public func handle(event: CoordinatorEvent) {
        if let homeEvent = event as? HomeExternalCoordinatorEvent {
            handle(homeEvent)
        }
    }
}

private extension AppCoordinator {
    
    func startHomeCoordinator(navigationController: UINavigationController) {
        let coordinator = HomeCoordinator(
            parentCoordinator: self,
            parentViewController: navigationController)
        
        coordinator.start {}
    }
    
    func startAddressCoordinator(navigationController: UINavigationController) {
        let coordinator = AddressCoordinator(
            parentCoordinator: self,
            parentViewController: navigationController)
        
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
}
