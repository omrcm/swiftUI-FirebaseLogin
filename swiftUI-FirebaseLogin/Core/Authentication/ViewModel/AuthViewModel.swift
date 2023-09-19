//
//  AuthViewModel.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        print("Sign In")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String, schollName: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email, schollName: schollName)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("user").document(user.id).setData(encodeUser)
            await fetchUser()
        } catch{
            print("Debug: Kullanıcı oluşturulurken hata oluştu ")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Debug: Çıkış işlemi esnasında hata oluştu")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
