//
//  RecipeCard.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct RecipeCard: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var recipe: Recipe

    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .bottom) {
                        Text(recipe.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 120)
                            .padding()
                    }
            } placeholder: {
                // ProgressView()
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(recipe.title)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding(.bottom, 8)
                    }
            }
            Image(systemName: recipe.starred ? "star.fill" : "star")
                .foregroundColor(.yellow)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
                .padding()
                .position(x: 20, y: 20)
                .onTapGesture {
                    recipesVM.toggleRecipeStar(recipe: recipe)
                }
        }
        .frame(width: 160, height: 180, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x:0, y: 10)
        
    }
}

#Preview {
    RecipeCard(recipe: Recipe.all[0])
}
