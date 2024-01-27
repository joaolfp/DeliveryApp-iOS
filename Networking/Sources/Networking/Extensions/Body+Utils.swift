//
//  Body+Utils.swift
//
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

public extension APIBody {

    var dataEncoded: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: .sortedKeys)
    }
}
