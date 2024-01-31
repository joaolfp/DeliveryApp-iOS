//
//  Events.swift
//
//
//  Created by João Lucas on 31/01/24.
//

import Foundation

public enum AnalyticsEvents {
    
    public enum Authentication: String {
        case view = "authentication_view"
        case success = "authentication_success"
        case error = "authentication_error"
        case button = "authentication_button"
    }
    
    public enum Home: String {
        case view = "home_view"
        case goAddress = "go_address"
    }
    
    public enum Address: String {
        case view = "address_view"
        case addressSelected = "address_selected"
    }
    
}
