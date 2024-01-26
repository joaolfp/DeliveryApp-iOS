//
//  HomeViewController.swift
//
//
//  Created by João Lucas on 23/03/23.
//

import Analytics
import Coordinator
import Core
import DesignSystem
import Networking
import Persistence
import UIKit

final class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()

    private lazy var containerView: LoadingContainerView = {
        let view = LoadingContainerView(
            containerView: self.homeView,
            errorView: ErrorView(message: L10n.messageError)
        )
        return view
    }()

    private var viewModel: HomeViewModelProtocol
    private let keychain: KeychainProtocol

    var coordinator: CoordinatorProtocol?

    init(viewModel: HomeViewModelProtocol = HomeViewModel(),
         keychain: KeychainProtocol = Keychain()) {
        self.viewModel = viewModel
        self.keychain = keychain
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = containerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.deliveryApp

        setupThemeNavigationBar()
        fetchRestaurantsList()
        setupAddress()

        SetAnalyticsEvents.event("home_view")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupAddress()
    }

    private func setupThemeNavigationBar() {
        guard let navigationController = self.navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .lightGray
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}

extension HomeViewController {

    private func setupAddress() {
        viewModel.didSetAddress = { [weak self] address in
            self?.homeView.addressView.setup(address: address)
        }

        viewModel.fetchAddress(keychain: keychain)
    }
}

extension HomeViewController {
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
        SetAnalyticsEvents.event("go_address")
        SetCrashlyticsEvents.event("go_address")
    }
}
