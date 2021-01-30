//
//  PuppyViewModel.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 2.03.21.
//

import SwiftUI
import Network

class PuppyViewModel: ObservableObject {
    
    var page: Int = 0
    @Published var puppyRecipes: [Recipe] = []
    @Published private(set) var isPageLoading: Bool = false
    
    func getRecipes() {
        guard !isPageLoading else {
            return
        }
        isPageLoading = true
        page += 1
        Network.RecipeAPI.getRecipe(i: "avocado,tomato", q: "salad", p: page) { [weak self] list, error in
            if let recipes = list?.results {
                self?.puppyRecipes.append(contentsOf: recipes)
            }
            self?.isPageLoading = false
        }
    }
    
    func clear() {
        page = 0
        isPageLoading = false
        puppyRecipes = []
    }
    
}
