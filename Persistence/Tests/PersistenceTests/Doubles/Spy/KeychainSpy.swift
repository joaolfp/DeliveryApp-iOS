//
//  KeychainSpy.swift
//
//
//  Created by João Lucas on 17/11/23.
//

import Foundation
@testable import Persistence

final class KeychainSpy: KeychainProtocol {

    var isSetValue: Bool

    var isGetValue: Bool

    var isRemoveValue: Bool

    var value = ""

    var forKey = ""

    init() {
        isSetValue = false
        isGetValue = false
        isRemoveValue = false
    }

    func setValue(value: String, forKey: Keys) {
        self.value = value
        self.forKey = forKey.rawValue

        isSetValue = true
    }

    func getValue(forKey: Keys) -> String? {
        self.forKey = forKey.rawValue

        isGetValue = true
        return value
    }

    func removeValue(forKey: Keys) {
        self.forKey = forKey.rawValue

        isRemoveValue = true
    }
}
