//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by Artsiom Sazonau on 12/20/20.
//

import SwiftUI

protocol Screen: View {}

@main
struct FirstAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootTabBar()
        }
    }
}
