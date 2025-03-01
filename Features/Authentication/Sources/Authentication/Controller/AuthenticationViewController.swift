//
//  AuthenticationViewController.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import Analytics
import Coordinator
import Core
import UIKit

final class AuthenticationViewController: UIViewController {

    private lazy var viewModel: AuthenticationViewModel = {
        let viewModel = AuthenticationViewModel()
        viewModel.delegate = self
        return viewModel
    }()

    var coordinator: CoordinatorProtocol?

    override func loadView() {
        let view = UIView()
        self.view = view
        let authenticationView = AuthenticationView(viewModel: viewModel)
        addSwiftUIView(authenticationView, to: view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        SetAnalyticsEvents.event(AnalyticsEvents.Authentication.view.rawValue)
    }
}

extension AuthenticationViewController: AuthenticationViewModelDelegate {
    func success() {
        coordinator?.handle(event: AuthenticationCoordinatorEvent.goToHome)
        SetAnalyticsEvents.event(AnalyticsEvents.Authentication.success.rawValue)
    }

    func failure() {
        debugPrint("Not working authentication")
        SetAnalyticsEvents.event(AnalyticsEvents.Authentication.error.rawValue)
    }
}
