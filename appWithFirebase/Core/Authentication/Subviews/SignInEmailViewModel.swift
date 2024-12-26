//
//  SignInEmailViewModel.swift
//  appWithFirebase
//
//  Created by Madina Olzhabek on 26.12.2024.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or password")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
     
    func signIn() async throws {
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or password")
            return
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}
