//
//  APIScheme.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

public enum APIScheme: String {
    case http
    case https

    public func toString() -> String {
        return self.rawValue
    }
}
