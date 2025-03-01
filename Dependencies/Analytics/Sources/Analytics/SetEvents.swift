//
//  SetEvents.swift
//
//
//  Created by João Lucas on 01/01/24.
//

import FirebaseAnalytics
import FirebaseCrashlytics
import Foundation

public enum SetAnalyticsEvents {

    public static func event(_ name: String) {
        Analytics.logEvent(name, parameters: nil)
    }

    public static func event(_ name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}

public enum SetCrashlyticsEvents {

    public static func event(_ name: String) {
        Crashlytics.crashlytics().log(name)
    }
}
