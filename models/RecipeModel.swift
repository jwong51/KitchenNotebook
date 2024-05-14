//
//  RecipeModel.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case breakfast = "Breakfast"
    case seafood = "Seafood"
    case meat = "Meat"
    case vegetable = "Vegetable"
    case rice = "Rice"
    case noodle = "Noodle"
    case desert = "Dessert"
    case drink = "Drink"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
}

struct Recipe: Identifiable, Codable {
    var id = UUID()
    var title: String
    var image: String
    var description: String
    var ingredients: [String]
    var directions: [String]
    var category: Category.RawValue
    var url: String
    var starred: Bool
    
    enum CodingKeys: String, CodingKey {
        case id // If the "id" key exists in the JSON, map it to the id property
        case title
        case category
        case image
        case url
        case directions
        case ingredients
        // Add other cases as needed
    }
    
    init(title: String, image: String, description: String, ingredients: [String], directions: [String], category: Category.RawValue, url: String, starred: Bool) {
        self.title = title
        self.image = image
        self.description = description
        self.ingredients = ingredients
        self.directions = directions
        self.category = category
        self.url = url
        self.starred = starred
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Try to decode the id if it's present in the JSON
        //        id = try container.decodeIfPresent(Int.self, forKey: .id)
        // Decode other properties
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        category = try container.decode(String.self, forKey: .category)
        image = try container.decode(String.self, forKey: .image)
        url = try container.decode(String.self, forKey: .url)
        directions = try container.decode([String].self, forKey: .directions)
        ingredients = try container.decode([String].self, forKey: .ingredients)
        // Decode other properties as needed
        starred = false
        description = ""
    }
}

extension Recipe {
    static var all: [Recipe] = []
}
