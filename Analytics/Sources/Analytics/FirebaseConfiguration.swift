//
//  FirebaseConfiguration.swift
//
//
//  Created by João Lucas on 01/01/24.
//

import FirebaseCore
import Foundation

public enum FirebaseConfiguration {

    public static func start() {
        FirebaseApp.configure()
    }
}
