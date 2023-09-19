//
//  NavigationLinkView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//

import SwiftUI

struct NavigationLinkView: View {
    
    let questionText: String
    let linkText: String
    
    var body: some View {
        NavigationLink{
            
        } label:{
            HStack(spacing:30){
                Text(questionText)
                Text(linkText)
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView(
            questionText: "",
            linkText: ""
        )
    }
}
