//
//  LoginView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 17.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                VStack{
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 120)
                        .padding(.vertical, 32)
                    
                    VStack(spacing: 24){
                        InputView(text: $email, title: "Email", placeholder: "mail@adresiniz.com")
                            .autocapitalization(.none)
                        
                        InputView(text: $password, title: "Şifre", placeholder: "Şifrenizi Giriniz", isSecureField: true)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    Button{
                        Task{
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label:{
                        HStack{
                            Text("Giriş Yap")
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
                    
                    NavigationLink{
                        RegistirationView()
                            .navigationBarBackButtonHidden()
                    } label:{
                        HStack(spacing:3){
                            Text("Hesabınız yok mu?")
                            Text("Hemen Hesap Açın")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                }
            }
        }
        else {
            // Fallback on earlier versions
            Button{
                RegistirationView()
                    .navigationBarBackButtonHidden()
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
