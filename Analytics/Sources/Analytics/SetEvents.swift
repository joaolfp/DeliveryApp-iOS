//
//  SetEvents.swift
//
//
//  Created by João Lucas on 01/01/24.
//

import Foundation
import FirebaseAnalytics
import FirebaseCrashlytics

public final class SetAnalyticsEvents {
    
    public static func event(_ name: String) {
        Analytics.logEvent(name, parameters: nil)
    }
    
    public static func event(_ name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}

public final class SetCrashlyticsEvents {

    public static func event(_ name: String) {
        Crashlytics.crashlytics().log(name)
    }
}
