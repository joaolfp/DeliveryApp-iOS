//
//  AddressServiceMock.swift
//  
//
//  Created by João Lucas on 01/10/23.
//

import Foundation
import Networking
import TestUtils
@testable import Address

final class AddressServiceMock: AddressServiceProtocol {
    
    enum StateMock {
        case success
        case failure
    }
    
    private let stateMock: StateMock
    
    init(stateMock: StateMock) {
        self.stateMock = stateMock
    }
    
    func getAddressList(completion: @escaping (Result<[AddressDTO], APIError>) -> Void) {
        switch stateMock {
        case .success:
            let address: [AddressDTO] = JSONHelper.loadJSON(withFile: "AddressList", inBundleWithName: "Address", path: "JSON")!
            completion(.success(address))
        case .failure:
            completion(.failure(APIError.jsonParsingFailure))
        }
    }
}
