//
//  SearchScreen.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 12/27/20.
//

import SwiftUI

struct ListScreen: Screen {
    @State var isFirstButtonTapped = false
    
    var testStrings = ["first",
                       "second",
                       "third",]
        .map(Object.init)
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(testStrings) { object in
                    NavigationLink(destination: Text("new Screen")) {
                        Text(object.string)
                    }
                }
            }
            .navigationTitle("List")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Object: Identifiable {
    let id = UUID()
    let string: String
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}


