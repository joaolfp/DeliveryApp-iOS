//
//  ObserverProtocol.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation

protocol ObserverProtocol {

    var id: Int { get set }
    func onValueChanged(_ value: Any?)
}

protocol ObservableProtocol: AnyObject {
    var observers: [ObserverProtocol] { get set }

    func addObserver(_ observer: ObserverProtocol)
    func removeObserver(_ observer: ObserverProtocol)
    func notifyObservers(_ observers: [ObserverProtocol])
}
