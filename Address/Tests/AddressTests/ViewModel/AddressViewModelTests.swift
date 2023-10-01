//
//  AddressViewModelTests.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import XCTest
import Core
import Networking
import TestUtils
@testable import Address

final class AddressViewModelTests: XCTestCase {
    
    func testVerifyLoadingWithSuccess() {
        let sut = AddressViewModel()
        let state = AddressViewModelStates()
        
        sut.fetchAddress()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertTrue(state.isLoading)
    }
    
    func testVerifyAddressListWithSuccess() {
        let mock = AddressServiceMock(stateMock: .success)
        let sut = AddressViewModel(service: mock)
        let state = AddressViewModelStates()
        
        sut.fetchAddress()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertEqual(state.addressList?[0].street, "Rua Augusta")
        XCTAssertEqual(state.addressList?[0].number, "495")
        XCTAssertEqual(state.addressList?[0].neighborhood, "Consolação")
    }
    
    func testVerifyAddressListWithFailure() {
        let mock = AddressServiceMock(stateMock: .failure)
        let sut = AddressViewModel(service: mock)
        let state = AddressViewModelStates()
        
        sut.fetchAddress()
            .loadingObserver(state.onLoading)
            .successObserver(state.onSuccess)
            .errorObserver(state.onFailure)
        
        XCTAssertEqual(state.error?.localizedDescription, "JSON parsing failure")
    }

}

final class AddressViewModelStates {
    
    var isLoading: Bool = false
    var addressList: [AddressDTO]?
    var error: APIError?
    
    func onLoading() {
        self.isLoading = true
    }
    
    func onSuccess(list: [AddressDTO]) {
        self.addressList = list
        self.isLoading = false
    }
    
    func onFailure(error: APIError) {
        self.error = error
    }
}
