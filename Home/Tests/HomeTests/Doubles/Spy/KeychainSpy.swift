//
//  File.swift
//  
//
//  Created by João Lucas on 18/11/23.
//

import Foundation
import Persistence

final class KeychainSpy: KeychainProtocol {
    
    var isSetValue: Bool
    var isGetValue: Bool
    var isRemoveValue: Bool
    
    var value: String = ""
    
    init() {
        isSetValue = false
        isGetValue = false
        isRemoveValue = false
    }
    
    func setValue(value: String, forKey: Keys) {
        self.value = value
        
        isSetValue = true
    }
    
    func getValue(forKey: Keys) -> String? {
        isGetValue = true
        
        return value
    }
    
    func removeValue(forKey: Keys) {
        isRemoveValue = true
    }
}
