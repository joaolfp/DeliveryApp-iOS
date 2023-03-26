//
//  Localizable.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation

enum Localizable: String {
    case deliveryApp = "Delivery App"
    
    func string() -> String {
        return self.rawValue
    }
}
