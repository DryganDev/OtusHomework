//
//  ModalScreen.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 27.01.21.
//

import SwiftUI

struct ModalScreen: Screen {
    
    @State var isModalPresent = false
    
    var body: some View {
        NavigationView {
            Button {
                isModalPresent.toggle()
            } label: {
                Text("Press me!")
            }
            .navigationTitle("Modal")
        }.sheet(isPresented: $isModalPresent) {
            Text("Modal")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ModalScreen_Previews: PreviewProvider {
    static var previews: some View {
        ModalScreen()
    }
}
