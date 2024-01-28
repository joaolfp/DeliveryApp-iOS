//
//  AuthenticationView.swift
//
//
//  Created by João Lucas on 28/01/24.
//

import SwiftUI
import DesignSystem

struct AuthenticationView: View {
    
    private let viewModel: AuthenticationViewModel
    
    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Autenticação")
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
                } label: {
                    Text("Entrar")
                        .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .font(.system(.headline))
                }
                .padding(.bottom, 20)
            }
        }
    }
}
