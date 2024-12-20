//
//  SignInView.swift
//  appWithFirebase
//
//  Created by Madina Olzhabek on 18.12.2024.
//

import SwiftUI

struct SignInView: View {
    
    @State var nameText: String = ""
    @State var passwordText: String = ""
    var forgotPasswordTapped: (() -> Void)? = nil
    var registerTapped: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Image(ImageResource.signinImg)
                .resizable()
                .overlay {
                    LinearGradient(colors: [.beigeTransparecy, .greenLight], startPoint: .top, endPoint: .bottom)
                }
                .ignoresSafeArea()
        
            VStack {
                
                Spacer()

                Text("Welcome!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.greenDark)
                
                Spacer()
                Spacer()
                
                VStack(spacing: 1) {
                    CustomTextField(icon: "person", placeholder: "User Name", text: $nameText, isSecure: false)
                        .background(.white.opacity(0.3))
                        .clipShape(.rect(topTrailingRadius: 90))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    CustomTextField(icon: "lock", placeholder: "Password", text: $passwordText, isSecure: true)
                        .background(.white.opacity(0.3))
                        .clipShape(.rect(bottomTrailingRadius: 90))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Text("Forgot Password ?")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding()
                    .padding(.top, 10)
                    .background(Color.white.opacity(0.001))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .onTapGesture {
                        forgotPasswordTapped?()
                    }
                
                Text("Register")
                    .font(.callout)
                    .foregroundStyle(.white)
                    .padding(30)
                    .padding(.leading, 20)
                    .background(Color.white.opacity(0.3))
                    .clipShape(.rect(bottomTrailingRadius: 90, topTrailingRadius: 90))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        registerTapped?()
                    }
                
                Spacer()
                Spacer()
            }
            
        }
    }
}

#Preview {
    SignInView()
}
