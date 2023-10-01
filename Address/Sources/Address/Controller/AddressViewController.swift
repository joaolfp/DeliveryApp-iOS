//
//  AddressViewController.swift
//  
//
//  Created by João Lucas on 01/10/23.
//

import UIKit
import Core

final class AddressViewController: UIViewController {
    
    private let addressView = AddressView()
    
    var coordinator: CoordinatorProtocol?
    
    override func loadView() {
        view = addressView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Endereço"
        view.backgroundColor = .white

    }
}
