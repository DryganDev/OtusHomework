//
//  ButtonScreen.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 24.01.21.
//

import SwiftUI


struct ButtonScreen: Screen {
    
    var action: () -> Void
    
    var body: some View {
        NavigationView {
            Button {
                action()
            } label: {
                HStack {
                    Text("Press me!")
                }
            }
            .navigationTitle("Screen for tap")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ButtonScreen_Previews: PreviewProvider {
    static var previews: some View {
        ButtonScreen(action: {})
    }
}
