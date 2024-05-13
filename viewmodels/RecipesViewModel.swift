//
//  RecipesViewModel.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        loadRecipesFromFile()
    }

    func loadRecipesFromFile() {
        if let url = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedRecipes = try decoder.decode([Recipe].self, from: data)
                recipes = decodedRecipes
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Could not find recipes.json file")
        }
    }
    
    // add a recipe
    func addRecipe(recipe: Recipe) {
        recipes.insert(recipe, at: 0)
    }
    
    // toggle the favorite flag
    func toggleRecipeStar(recipe: Recipe) {
        if let index = findRecipeIndex(byId: recipe.id) {
            let starred = !recipes[index].starred
            recipes[index].starred = starred
        }
    }
    
    // Function to find a recipe by ID
    func findRecipe(byId id: UUID) -> Recipe? {
        return recipes.first(where: { $0.id == id })
    }

    // Function to find an index to the recipe by ID
    func findRecipeIndex(byId id: UUID) -> Int? {
        return recipes.firstIndex(where: { $0.id == id })
    }
}
