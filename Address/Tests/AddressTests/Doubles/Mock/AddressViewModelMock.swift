//
//  AddressViewModelMock.swift
//
//
//  Created by João Lucas on 01/10/23.
//

@testable import Address
import Foundation
import Networking
import TestUtils
import ViewState

final class AddressViewModelMock: AddressViewModelProtocol {
    var viewState = ViewState<[AddressDTO], APIError>()

    enum StateMock {
        case success
        case failure
    }

    private let stateMock: StateMock

    init(stateMock: StateMock) {
        self.stateMock = stateMock
    }

    func fetchAddress() -> ViewState<[AddressDTO], APIError> {
        viewState.fetchSource {
            switch self.stateMock {
            case .success:
                let address: [AddressDTO] = JSONHelper.loadJSON(withFile: "AddressList", inBundleWithName: "Address", path: "JSON")!
                self.viewState.success(data: address)
            case .failure:
                self.viewState.error(error: APIError.jsonParsingFailure)
            }
        }

        return viewState
    }
}
