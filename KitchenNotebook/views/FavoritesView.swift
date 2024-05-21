//
//  FavoritesView.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes.filter{ $0.starred })
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    FavoritesView()
        .environmentObject(RecipesViewModel())
}
