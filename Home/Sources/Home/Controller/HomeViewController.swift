//
//  HomeViewController.swift
//  
//
//  Created by João Lucas on 23/03/23.
//

import UIKit
import Core
import Networking
import DesignSystem

final class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
    private lazy var containerView: LoadingContainerView = {
        let view = LoadingContainerView(
            containerView: self.homeView,
            errorView: ErrorView(message: Localizable.messageError.rawValue))
        return view
    }()
    
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
        self.view = containerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Localizable.deliveryApp.rawValue
        
        setupThemeNavigationBar()
        fetchRestaurantsList()
    }
    
    private func setupThemeNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .lightGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    private func fetchRestaurantsList() {
        viewModel.fetchRestaurants()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    private func onLoading() {
        containerView.status = .loading
    }
    
    private func onSuccess(restaurants: [RestaurantsDTO]) {
        containerView.status = .showView
        homeView.optionsView.setup(data: restaurants)
        homeView.restaurantView.setup(data: restaurants)
    }
    
    private func onFailure(error: APIError) {
        containerView.status = .showError
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func goToAddress() {
        coordinator?.handle(event: HomeCoordinatorEvent.goToAddress)
    }
}
