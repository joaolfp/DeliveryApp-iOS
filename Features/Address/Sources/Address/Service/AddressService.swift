//
//  AddressService.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Foundation
import Networking

protocol AddressServiceProtocol {
    func getAddressList(completion: @escaping (Result<[AddressDTO], APIError>) -> Void)
}

final class AddressService: AddressServiceProtocol {

    private let client: APIClientProtocol

    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }

    func getAddressList(completion: @escaping (Result<[AddressDTO], APIError>) -> Void) {
        let endpoint: AddressEndpoint = .getAddressList
        let request = endpoint.request

        client.request(request, completion: completion)
    }
}
