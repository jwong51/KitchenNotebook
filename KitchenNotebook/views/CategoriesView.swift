//
//  CategoriesView.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            RecipeList(recipes: recipesVM.recipes.filter{ $0.category == category.rawValue })
                        }
                        .navigationTitle(category.rawValue + " Category")
                    } label: {
                        Text(category.rawValue + "s")
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(RecipesViewModel())
}
