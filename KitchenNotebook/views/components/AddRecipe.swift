//
//  AddRecipe.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct AddRecipe: View {
    @State private var title: String = ""
    @State private var selectedCategory: Category = Category.meat
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe: Bool = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var recipesVM: RecipesViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $title)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
//                Section(header: Text("Description")) {
//                    TextEditor(text: $description)
//                }
                Section(header: Text("Ingradients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem {
                    Button {
                        print("Saving recipe...")
                        saveRecipe()
                        navigateToRecipe = true
                        print(navigateToRecipe)
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                        
                        NavigationLink(isActive: $navigateToRecipe) {
                            RecipeDetail(recipe: recipesVM.recipes[0])
                                .navigationBarBackButtonHidden(true)
                        } label: {
                        }

                    }
                    .disabled(title.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

extension AddRecipe {
    private func saveRecipe() {
        let recipe = Recipe(title: title, image: "", description: description, ingredients: ingredients.components(separatedBy: "\n"), directions: directions.components(separatedBy: "\n"), category: selectedCategory.rawValue, url: "", starred: false)
        recipesVM.addRecipe(recipe: recipe)
    }
}

#Preview {
    AddRecipe()
        .environmentObject(RecipesViewModel())
}
