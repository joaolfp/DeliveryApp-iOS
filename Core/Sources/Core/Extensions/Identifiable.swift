//
//  Indentifiable.swift
//  
//
//  Created by joao.lucas.f.pereira on 24/03/23.
//

import UIKit

import UIKit

public protocol Identifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Identifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
