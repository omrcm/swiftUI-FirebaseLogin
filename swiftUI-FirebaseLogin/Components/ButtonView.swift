//
//  ButtonView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonName: String
    
    var body: some View {
        Button{
            print("Log user in...")
        } label:{
            HStack{
                Text(buttonName)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(.blue)
        .cornerRadius(10)
        .padding(.top, 24)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonName: "")
    }
}
