//
//  HomeViewController.swift
//  
//
//  Created by joao.lucas.f.pereira on 23/03/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let service: HomeServiceProtocol
    
    var coordinator: HomeCoordinator?
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRestaurantsList()
    }
    
    private func fetchRestaurantsList() {
        service.getRestaurantsList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                self.homeView.restaurantView.setup(data: restaurants)
            case .failure(let error):
                debugPrint("Error - \(error)")
            }
        }
    }

}
