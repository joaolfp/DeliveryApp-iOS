//
//  BaseCoordinator.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation

open class BaseCoordinator: CoordinatorProtocol {
    public let parentCoordinator: CoordinatorProtocol?

    public init(parentCoordinator: CoordinatorProtocol? = nil) {
        self.parentCoordinator = parentCoordinator
    }

    open func handle(event: CoordinatorEvent) {}

    open func start(_ completion: @escaping () -> Void) {
        completion()
    }
}
