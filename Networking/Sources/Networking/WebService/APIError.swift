//
//  APIError.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation

public enum APIError: Error {
    case requestFailed(reason: String?)
    case jsonConversionFailure
    case responseUnsuccessful
    case invalidData
    case jsonParsingFailure
    case requestCancelled
    
    public var localizedDescription: String {
        switch self {
        case .requestFailed(let reason):
            return "Request Failed: \(reason ?? "unknown")"
        case .jsonParsingFailure:
            return "JSON parsing failure"
        case .jsonConversionFailure:
            return "JSON conversion failure"
        case .responseUnsuccessful:
            return "Response unsuccessful"
        case .invalidData:
            return "Invalid data"
        case .requestCancelled:
            return "Request cancelled"
        }
    }
}
