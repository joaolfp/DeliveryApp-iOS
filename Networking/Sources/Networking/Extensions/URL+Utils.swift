//
//  URL+Utils.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation

extension URLRequest {

    public init(with url: URL?) {
        guard let url = url else {
            preconditionFailure("Invalid URL")
        }
        self = URLRequest(url: url)
    }
}
