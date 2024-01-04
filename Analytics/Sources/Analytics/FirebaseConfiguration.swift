//
//  FirebaseConfiguration.swift
//
//
//  Created by João Lucas on 01/01/24.
//

import Foundation
import FirebaseCore

public final class FirebaseConfiguration {
    
    public static func start() {
        FirebaseApp.configure()
    }
}
