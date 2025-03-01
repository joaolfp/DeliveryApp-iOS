//
//  Keychain.swift
//
//
//  Created by João Lucas on 17/11/23.
//

import Foundation

public enum Keys: String {
    case address
}

public protocol KeychainProtocol {
    func setValue(value: String, forKey: Keys)
    func getValue(forKey: Keys) -> String?
    func removeValue(forKey: Keys)
}

public final class Keychain: KeychainProtocol {

    public init() {}

    public func setValue(value: String, forKey: Keys) {
        UserDefaults.standard.setValue(value, forKey: forKey.rawValue)
    }

    public func getValue(forKey: Keys) -> String? {
        let token = UserDefaults.standard.string(forKey: forKey.rawValue)
        return token
    }

    public func removeValue(forKey: Keys) {
        UserDefaults.standard.removeObject(forKey: forKey.rawValue)
    }
}
