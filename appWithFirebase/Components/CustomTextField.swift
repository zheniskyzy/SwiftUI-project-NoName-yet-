//
//  CustomTextField.swift
//  appWithFirebase
//
//  Created by Madina Olzhabek on 18.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                
            Group {
                if isSecure {
                    SecureField("", text: $text, prompt: Text(placeholder).foregroundStyle(.white))
                } else {
                    TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.white))
                }
            }
            .foregroundStyle(.white)
            .bold()
            .padding()
            .frame(maxWidth: 270)
        }
        .padding(.horizontal,24)
        .padding(.vertical, 10)
    }
}

#Preview {
    
    @State var text: String = ""

    return ZStack {
        Color.red.opacity(0.5).ignoresSafeArea()
        VStack(spacing: 1) {
            CustomTextField(icon: "person", placeholder: "User Name", text: $text, isSecure: false)
                .background(Color.white.opacity(0.3))
                .clipShape(.rect(topTrailingRadius: 90))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CustomTextField(icon: "lock", placeholder: "Password", text: $text, isSecure: true)
                .background(Color.white.opacity(0.3))
                .clipShape(.rect(bottomTrailingRadius: 90))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
