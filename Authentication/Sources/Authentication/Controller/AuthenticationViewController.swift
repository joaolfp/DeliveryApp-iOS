//
//  AuthenticationViewController.swift
//  
//
//  Created by João Lucas on 28/01/24.
//

import UIKit
import Core
import Coordinator

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
        self.addSwiftUIView(authenticationView, to: view)
    }
}

extension AuthenticationViewController: AuthenticationViewModelDelegate {
    func success() {
        coordinator?.handle(event: AuthenticationCoordinatorEvent.goToHome)
    }
    
    func failure() {
        debugPrint("Not working authentication")
    }
}
