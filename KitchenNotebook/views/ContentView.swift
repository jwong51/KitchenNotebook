//
//  ContentView.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var body: some View {
        TabBar()
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
