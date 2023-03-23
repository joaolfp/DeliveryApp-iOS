//
//  HomeViewController.swift
//  
//
//  Created by joao.lucas.f.pereira on 23/03/23.
//

import UIKit

final public class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    public override func loadView() {
        self.view = homeView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Delivery"
    }

}
