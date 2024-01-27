//
//  AddressViewModel.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Foundation
import Networking
import ViewState

protocol AddressViewModelProtocol {
    var viewState: ViewState<[AddressDTO], APIError> { get }
    func fetchAddress() -> ViewState<[AddressDTO], APIError>
}

final class AddressViewModel: AddressViewModelProtocol {

    var viewState = ViewState<[AddressDTO], APIError>()
    private let service: AddressServiceProtocol

    init(service: AddressServiceProtocol = AddressService()) {
        self.service = service
    }

    func fetchAddress() -> ViewState<[AddressDTO], APIError> {
        viewState.fetchSource { self.stateAddress() }
        return viewState
    }

    private func stateAddress() {
        service.getAddressList { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(address):
                viewState.success(data: address)
            case let .failure(error):
                viewState.error(error: error)
            }
        }
    }
}
