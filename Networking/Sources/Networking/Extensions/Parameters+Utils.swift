//
//  Parameters+Utils.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

extension APIParameters {
    public var queryItems: [URLQueryItem] {
        return compactMap { URLQueryItem(name: $0, value: $1) }
    }
}
