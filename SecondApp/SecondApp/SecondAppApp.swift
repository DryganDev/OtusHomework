//
//  SecondAppApp.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 11.02.21.
//

import SwiftUI

@main
struct SecondAppApp: App {
    
    var router: Router = .init()
    var puppyViewModel: PuppyViewModel = .init()
    var cryptoViewModel: CryptoViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
                .environmentObject(puppyViewModel)
                .environmentObject(cryptoViewModel)
        }
    }
}
