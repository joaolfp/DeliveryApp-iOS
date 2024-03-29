//
//  Identifiable.swift
//
//
//  Created by João Lucas on 24/03/23.
//

import UIKit

public protocol Identifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Identifiable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
