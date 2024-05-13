//
//  FirebaseAPI.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import Firebase

class RecipesViewController: UIViewController {
    
    var recipesRef: DatabaseReference!
    var recipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up Firebase Realtime Database reference
        recipesRef = Database.database().reference().child("recipes")
        
        // Read data from Firebase
        recipesRef.observe(.value) { snapshot in
            // Parse snapshot into Recipe objects
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let recipe = Recipe(snapshot: snapshot) {
                    self.recipes.append(recipe)
                }
            }
            
            // Update UI or perform further processing with recipes data
            // For example, populate a table view with recipes
            // tableView.reloadData()
        }
    }
}
