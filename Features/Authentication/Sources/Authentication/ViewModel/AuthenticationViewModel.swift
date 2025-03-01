//
//  AuthenticationViewModel.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import Foundation
import LocalAuthentication
import SwiftUI

protocol AuthenticationViewModelDelegate: AnyObject {
    func success()
    func failure()
}

final class AuthenticationViewModel {

    weak var delegate: AuthenticationViewModelDelegate?

    func validate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            evaluatePolicy(context: context)
        } else {
            print("Autenticação indisponivel")
        }
    }
    
    private func evaluatePolicy(context: LAContext) {
        let reason = L10n.enterYourAuthentication

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, _ in

            guard let self else { return }

            if success {
                DispatchQueue.main.async {
                    self.delegate?.success()
                }
            } else {
                delegate?.failure()
            }
        }
    }
}
