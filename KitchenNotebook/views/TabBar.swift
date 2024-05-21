//
//  TabBar.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Home", systemImage: "house") }
            CategoriesView().tabItem { Label("Categories", systemImage: "square.fill.text.grid.1x2") }
            NewRecipeView().tabItem { Label("New", systemImage: "plus") }
            FavoritesView().tabItem { Label("Favorites", systemImage: "heart") }
            AboutView().tabItem { Label("About", systemImage: "info.bubble.rtl") }
        }
    }
}

#Preview {
    TabBar()
        .environmentObject(RecipesViewModel())
}
