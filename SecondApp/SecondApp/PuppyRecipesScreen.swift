//
//  PuppyRecipesView.swift
//  SecondApp
//
//  Created by Artsiom Sazonau on 28.02.21.
//

import SwiftUI
import Network
import UIComponents

extension Recipe: Identifiable {
    
    public var id: String {
        href
    }
    
}

struct PuppyRecipesScreen: View {
    
    @ObservedObject var puppyViewModel: PuppyViewModel
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            List {
                Section(header: Text("Hi")) {
                    ForEach(puppyViewModel.puppyRecipes) { recipe in
                        NavPushButton(destination: LazyView(PuppyRecipesScreenDetail(recipe: recipe))) {
                            PuppyRecipesCell(recipe: recipe)
                                .onAppear {
                                    if puppyViewModel.puppyRecipes.isLast(recipe) {
                                        puppyViewModel.getRecipes()
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                puppyViewModel.getRecipes()
            }
        }
    }
    
}

struct PuppyRecipesScreenDetail: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .center) {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .font(.largeTitle)
            }
            NavPushButton(destination: PuppyRecipesScreenDetailDetail(title: recipe.title!)) {
                VStack {
                    Text("Title:")
                        .foregroundColor(.blue)
                    Text(recipe.title!)
                        .foregroundColor(.blue)
                }
                
            }
            Text("Ingredients:")
            Text(recipe.ingredients!)
        }
    }
    
}

struct PuppyRecipesScreenDetailDetail: View {
    
    var title: String
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .font(.largeTitle)
            }
            VStack {
                Text("Title:")
                Text(title)
            }
            .accentColor(.blue)
        }
    }
    
}

struct PuppyRecipesCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack() {
            Text(recipe.title!)
            Text(recipe.ingredients!)
        }
    }
}
