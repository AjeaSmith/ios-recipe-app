//
//  Recipe.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/30/22.
//

// Data to convert the JSON data to
import Foundation

class Recipe: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings:Int
    var ingredients: [String]
    var directions: [String]
}
