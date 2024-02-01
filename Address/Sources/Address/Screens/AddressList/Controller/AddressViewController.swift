//
//  AddressViewController.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Analytics
import Coordinator
import Core
import DesignSystem
import Networking
import Persistence
import UIKit

final class AddressViewController: UIViewController {

    private lazy var addressView: AddressView = {
        let view = AddressView()
        view.delegate = self
        return view
    }()

    private lazy var containerView: LoadingContainerView = {
        let view = LoadingContainerView(
            containerView: self.addressView,
            errorView: ErrorView(message: L10n.messageError)
        )
        return view
    }()

    private let viewModel: AddressViewModelProtocol

    var coordinator: CoordinatorProtocol?

    init(viewModel: AddressViewModelProtocol = AddressViewModel()) {
        self.viewModel = viewModel
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

        title = L10n.address
        fetchAddressList()

        SetAnalyticsEvents.event("address_view")
    }
}

extension AddressViewController {

    func fetchAddressList() {
        viewModel.fetchAddress()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }

    func onLoading() {
        containerView.status = .loading
    }

    func onSuccess(list: [AddressDTO]) {
        containerView.status = .showView
        addressView.setup(data: list)
        
        SetAnalyticsEvents.event(AnalyticsEvents.Address.successService.rawValue)
    }

    func onFailure(error: APIError) {
        containerView.status = .showError
        SetAnalyticsEvents.event(AnalyticsEvents.Address.errorService.rawValue)
    }
}

extension AddressViewController: AddressViewDelegate {

    func getAddressSelected(item: AddressDTO) {
        let address = "\(item.street), \(item.number)"
        Keychain().setValue(value: address, forKey: .address)

        SetAnalyticsEvents.event(AnalyticsEvents.Address.addressSelected.rawValue,
                                 parameters: ["value": "\(item.street), \(item.number)"])
        SetCrashlyticsEvents.event("\(AnalyticsEvents.Address.addressSelected.rawValue) - \("\(item.street), \(item.number)")")

        coordinator?.handle(event: AddressCoordinatorEvent.popViewController(animated: true))
    }
}
