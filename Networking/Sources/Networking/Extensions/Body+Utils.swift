//
//  Body+Utils.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation

extension APIBody {
    
    public var dataEncoded: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .sortedKeys)
    }
}
