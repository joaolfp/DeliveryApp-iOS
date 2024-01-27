//
//  AddressViewModelMock.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Foundation
import Networking
import TestUtils
import ViewState
@testable import Address

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
