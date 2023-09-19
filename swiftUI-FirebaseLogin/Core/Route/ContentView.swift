//
//  ContentView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 17.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        LoginView()
        /*
        Group{
            if viewModel.currentUser != nil{
                LoginView()
            }else {
                ProfileView()
            }
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
