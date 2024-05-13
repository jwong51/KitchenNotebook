//
//  RecipeDetail.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 250)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]), startPoint: .top, endPoint: .bottom))

            VStack(spacing: 20) {
                Text(recipe.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30) {

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ingredients")
                            .font(.headline)
                        
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            HStack(alignment: .top, spacing: 5) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .padding(.top, 3) // Adjust vertical alignment of bullet point
                                Text(ingredient)
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Directions")
                            .font(.headline)
                        ForEach(recipe.directions, id: \.self) { direction in
                            HStack(alignment: .top, spacing: 5) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .padding(.top, 3) // Adjust vertical alignment of bullet point
                                Text(direction)
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
                            }
                        }

                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    RecipeDetail(recipe: Recipe.all[0])
}
