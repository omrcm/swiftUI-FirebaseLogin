//
//  BackgroundView.swift
//  swiftUI-FirebaseLogin
//
//  Created by Ömür Uçum on 18.09.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.green, .gray]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
