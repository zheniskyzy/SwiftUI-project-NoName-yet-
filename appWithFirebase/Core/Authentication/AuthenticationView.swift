//
//  AuthenticationView.swift
//  appWithFirebase
//
//  Created by Madina Olzhabek on 23.12.2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    do {
                        try await viewModel.signInAnonymous()
                        showSignInView = false // dissmis screen
                    } catch  {
                        print(error)
                    }
                }
            }, label: {
                Text("Sign In Anonymously")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
            })
            .frame(height: 55)
            
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView )
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        showSignInView = false // dissmis screen
                    } catch  {
                        print(error)
                    }
                }
            }
            
            Button(action: {
                Task {
                    do {
                        try await viewModel.signInApple()
                        showSignInView = false // dissmis screen
                    } catch  {
                        print(error)
                    }
                }
            }, label: {
                SignInWithAppleButtonRepresentable(type: .default, style: .black)
                    .allowsHitTesting(false)
            })
            .frame(height: 55)
            
            Spacer()
        }
        .padding()
            .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignInView: .constant(false))
        }
    }
}

//MARK: - what i need to know

// button to signIn
/*SignInWithAppleButton { request in
    
} onCompletion: { result in
    
} */

