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
    
    var coordinator: CoordinatorProtocol?
    
    override func loadView() {
        let view = UIView()
        self.view = view
        let authenticationView = AuthenticationView()
        self.addSwiftUIView(authenticationView, to: view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
