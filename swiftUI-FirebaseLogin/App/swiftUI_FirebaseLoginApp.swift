//
//  swiftUI_FirebaseLoginApp.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 17.09.2023.
//

import SwiftUI
import Firebase

@main
struct swiftUI_FirebaseLoginApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
