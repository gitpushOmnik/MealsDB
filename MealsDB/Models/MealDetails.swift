//
//  MealDetails.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

/// A model representing a collection of meal details.
struct MealDetails: Codable {
    let meals: [MealDetail]?
}

/// A model representing detailed information about a meal.
struct MealDetail: Codable {
    let title: String?
    let imageURLString: String?
    let id: String?
    var instructions: [String]?
    var ingredients: [String] = []
    var measurements: [String] = []
}

extension MealDetail {
    enum DecodingKeys: CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
        case strInstructions
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    /// Initializes a meal detail from decoder.
    /// - Parameter decoder: The decoder to read data from.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKeys.self)
        id = try container.decode(String.self, forKey: .idMeal)
        title = try container.decode(String.self, forKey: .strMeal)
        imageURLString = try container.decode(String.self, forKey: .strMealThumb)
        
        do {
            try decodeInstructions(from: container)
            try decodeIngredientsAndMeasurements(from: container)
        } catch {
            print("Error Occured while decoding. \(error.localizedDescription)")
        }
    }
    
    /// Decodes instructions from the container.
    /// - Parameter container: The keyed decoding container.
    private mutating func decodeInstructions(from container: KeyedDecodingContainer<DecodingKeys>) throws {
        let instruction = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        
        // Remove escape sequences and seperate instructions text into an array
        instructions = instruction?.replacingOccurrences(of: Constants.Regex.escapePattern, with: "", options: .regularExpression)
            .replacingOccurrences(of: Constants.Regex.spacePattern, with: " ", options: .regularExpression)
            .replacingOccurrences(of: Constants.Regex.parenthesisPattern, with: "", options: .regularExpression)
            .components(separatedBy: ". ")
            .filter { $0.count > 1 }
            .map { $0.last == "." || $0.last == "!" ? $0 : $0 + "." }
    }
    
    /// Decodes ingredients and measurements from the container.
    /// - Parameter container: The keyed decoding container.
    private mutating func decodeIngredientsAndMeasurements(from container: KeyedDecodingContainer<DecodingKeys>) throws {
        for index in 1...20 {
            guard let ingredientKey = DecodingKeys(stringValue: "strIngredient\(index)"),
                  let measureKey = DecodingKeys(stringValue: "strMeasure\(index)") else {
                break
            }
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey)?.trimmingCharacters(in: .whitespaces), !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            
            if let measure = try container.decodeIfPresent(String.self, forKey: measureKey)?.trimmingCharacters(in: .whitespaces), !measure.isEmpty {
                measurements.append(measure)
            }
        }
    }
}

/// Compares two meal details for equality based on their IDs.
extension MealDetail: Equatable {
    static func == (lhs: MealDetail, rhs: MealDetail) -> Bool {
        lhs.id == rhs.id
    }
}
