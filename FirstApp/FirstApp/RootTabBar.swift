//
//  RootTabBar.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 12/20/20.
//

import SwiftUI

struct RootTabBar: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ButtonScreen {
                selection = 1
            }.tabItem {
                Image(systemName: "person")
                Text("Tab 1")
            }.tag(0)
            ListScreen().tabItem {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Tab 2")
                }
            }.tag(1)
            ModalScreen().tabItem {
                HStack {
                    Text("Tab 3")
                    Image(systemName: "pencil")
                }
            }.tag(2)
        }
    }
}

struct RootTabBar_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBar()
    }
}
