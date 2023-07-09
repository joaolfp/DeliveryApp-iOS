//
//  HomeViewController.swift
//  
//
//  Created by João Lucas on 23/03/23.
//

import UIKit
import Core
import Networking

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private let viewModel: HomeViewModelProtocol
    
    var coordinator: CoordinatorProtocol?
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
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
        viewModel.fetchRestaurants()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    private func onLoading() {
        debugPrint("loading")
    }
    
    private func onSuccess(restaurants: [RestaurantsDTO]) {
        homeView.optionsView.setup(data: restaurants)
        homeView.restaurantView.setup(data: restaurants)
    }
    
    private func onFailure(error: APIError) {
        debugPrint(error)
    }
}
