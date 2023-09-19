//
//  RegistirationView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//

import SwiftUI

struct RegistirationView: View {
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var schollName = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Image(systemName: "books.vertical.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 120)
                .padding(.vertical, 32)
            
            VStack(spacing: 24){
                InputView(text: $fullName, title: "Ad Soyad", placeholder: "Ad Soyad")
                    .autocapitalization(.none)
                
                InputView(text: $email, title: "Mail Adresiniz", placeholder: "mail@adresiniz.com")
                
                InputView(text: $schollName, title: "Okul Adı", placeholder: "Özel Acıbadem Koleji")
                
                InputView(text: $password, title: "Şifreniz", placeholder: "Şifre Girin", isSecureField: true)
                
                InputView(text: $repeatPassword, title: "Şifre Tekrarı", placeholder: "Şifre Tekrarı", isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button{
                Task{
                    try await viewModel.createUser(
                        withEmail: email,
                        password: password,
                        fullName: fullName,
                        schollName: schollName)
                }
            } label:{
                HStack{
                    Text("Kayıt Ol")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(.blue)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing:3){
                    Text("Zaten Üye misiniz?")
                    Text("Giriş Yap")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
            
        }
    }
}

struct RegistirationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistirationView()
    }
}
