//
//  APIMethod.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation

public enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"

    public func toString() -> String {
        return self.rawValue
    }
}
