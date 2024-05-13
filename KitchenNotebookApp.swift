//
//  KitchenNotebookApp.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

@main
struct KitchenNotebookApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RecipesViewModel())
        }
    }
}
