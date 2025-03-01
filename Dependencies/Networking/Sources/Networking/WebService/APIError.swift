//
//  APIError.swift
//
//
//  Created by João Lucas on 25/03/23.
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
        case let .requestFailed(reason):
            "Request Failed: \(reason ?? "unknown")"
        case .jsonParsingFailure:
            "JSON parsing failure"
        case .jsonConversionFailure:
            "JSON conversion failure"
        case .responseUnsuccessful:
            "Response unsuccessful"
        case .invalidData:
            "Invalid data"
        case .requestCancelled:
            "Request cancelled"
        }
    }
}
