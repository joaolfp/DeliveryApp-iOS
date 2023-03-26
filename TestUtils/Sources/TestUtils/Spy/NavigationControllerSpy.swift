//
//  NavigationControllerSpy.swift
//  
//
//  Created by joao.lucas.f.pereira on 26/03/23.
//

import UIKit

final public class NavigationControllerSpy: UINavigationController {

    public var isPresentCalled: Bool

    public var isDismissCalled: Bool

    public var isShowCalled: Bool

    public var isShowDetailViewControllerCalled: Bool

    public var isPushViewControllerCalled: Bool

    public var isPopViewControllerCalled: Bool

    public var isSetViewControllersCalled: Bool

    public var isPopToRootViewControllerCalled: Bool

    public var isPopToViewControllerCalled: Bool

    public var presentViewController: UIViewController?

    public var showViewController: UIViewController?

    public var showDetailViewController: UIViewController?

    public var pushViewController: UIViewController?

    public var isInWindow: Bool {
        return view.window != nil
    }

    public init() {
        isPresentCalled = false
        isDismissCalled = false
        isShowCalled = false
        isShowDetailViewControllerCalled = false
        isPushViewControllerCalled = false
        isPopViewControllerCalled = false
        isSetViewControllersCalled = false
        isPopToRootViewControllerCalled = false
        isPopToViewControllerCalled = false
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience override init(rootViewController: UIViewController) {
        self.init()
        super.setViewControllers([rootViewController], animated: false)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        isPresentCalled = true
        presentViewController = viewControllerToPresent

        if isInWindow {
            super.present(viewControllerToPresent, animated: false, completion: completion)
        }
    }

    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissCalled = true

        if isInWindow {
            super.dismiss(animated: false)
            completion?()
        }
    }

    override public func show(_ vc: UIViewController, sender: Any?) {
        isShowCalled = true
        showViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override public func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        isShowDetailViewControllerCalled = true
        showDetailViewController = vc

        if isInWindow {
            super.show(vc, sender: sender)
        }
    }

    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushViewControllerCalled = true
        pushViewController = viewController

        if isInWindow {
            super.pushViewController(viewController, animated: false)
        }
    }

    override public func popViewController(animated: Bool) -> UIViewController? {
        isPopViewControllerCalled = true

        if isInWindow {
            return super.popViewController(animated: false)
        }

        return nil
    }

    override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        isPopToRootViewControllerCalled = true

        if isInWindow {
            return super.popToRootViewController(animated: false)
        }

        return nil
    }

    override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        isPopToViewControllerCalled = true

        if isInWindow {
            return super.popToViewController(viewController, animated: false)
        }

        return nil
    }

    override public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        isSetViewControllersCalled = true

        if isInWindow {
            super.setViewControllers(viewControllers, animated: false)
        }
    }
}
