//
//  User.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//
// Swift içinde yer alan PersonNameComponentsFormatter kullanılarak ProfileView içinde oluşturduğumuz ve kullanıcı ad, soyad bilgisinin baş hafrleriyle oluşan kısmı yapıyoruz
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullName: String
    let email: String
    let schollName: String
    
    var initiable: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}


extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Ömür UÇUM", email: "omur@omurucum.com", schollName: "Özel Acıbadem Koleji")
}
