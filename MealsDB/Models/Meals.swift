//
//  Meal.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

/// A model representing a collection of meals.
struct Meals: Codable {
    let meals: [Meal]?
}

/// A model representing a meal.
struct Meal: Codable, Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

/// Compares two meals for equality based on their IDs.
extension Meal: Equatable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.id == rhs.id
    }
}
