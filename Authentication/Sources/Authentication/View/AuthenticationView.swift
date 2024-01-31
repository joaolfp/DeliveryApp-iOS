//
//  AuthenticationView.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import SwiftUI
import DesignSystem
import Analytics

struct AuthenticationView: View {
    
    private let viewModel: AuthenticationViewModel
    
    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(L10n.authentication)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.leading, 20)
                        
            VStack {
                Spacer()
                
                Image(uiImage: UIAssets.Authentication.biometric.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                
                Spacer()
                
                Button {
                    viewModel.validate()
                    SetAnalyticsEvents.event(AnalyticsEvents.Authentication.button.rawValue)
                    SetCrashlyticsEvents.event(AnalyticsEvents.Authentication.button.rawValue)
                } label: {
                    Text(L10n.enter)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .font(.system(.headline))
                }
                .padding(.bottom, 20)
            }
        }
    }
}
