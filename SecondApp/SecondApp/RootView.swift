//
//  RootView.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 22.02.21.
//

import SwiftUI



struct RootView: View {
    
    enum Section: Int, CaseIterable, Identifiable {
        case puppy
        case crypto
        case rick

        var id: Int { self.rawValue }
        
        var description: String {
            switch self {
            case .puppy: return "puppy"
            case .crypto: return "crypto"
            case .rick: return "rick"
            }
        }
        
        static var all: [String] { Section.allCases.map{ $0.description } }
    }
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var puppyViewModel: PuppyViewModel
    @EnvironmentObject var cryptoViewModel: CryptoViewModel
    
    var body: some View {
        VStack {
            Picker(router.sectionIndex.description,
                   selection: Binding(get: { Section(rawValue: router.sectionIndex)!.description },
                                      set: { router.sectionIndex = Section.all.firstIndex(of: $0)! })) {
                ForEach(Section.all, id: \.self) { pickerSection in
                    Text(pickerSection.description).tag(pickerSection)
                }
            }
            .animation(nil)
            .pickerStyle(SegmentedPickerStyle())
            PagerView(pageCount: 2, currentIndex: $router.sectionIndex) {
                PuppyRecipesScreen(puppyViewModel: puppyViewModel)
                CryptoOrdersScreen(cryptoViewModel: cryptoViewModel)
            }
        }
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
