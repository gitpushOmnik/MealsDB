//
//  MockData.swift
//  MealsDBTests
//
//  Created by Omkar Nikhal on 7/7/24.
//

@testable import MealsDB
import Foundation

enum MockData {
    static let category = "Dessert"
    
    static let testMealID = "52898"
    
    static let testMeal: Meal = Meal(id: "52898",
                                      title: "Chelsea Buns",
                                      thumbnail: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg")
    
    static let testMealDetail: MealDetails = MealDetails(meals: [MealDetail(title: "Banana Pancakes",
                                                                            imageURLString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                                                                            id: "52855",
                                                                            ingredients: ["Eggs", "Baking Powder", "Vanilla Extract", "Oil", "Pecan Nuts", "Raspberries"],
                                                                            measurements: ["1 large", "2 medium", "pinch", "spinkling", "1 tsp ","25g","125g"])])
    
    static let testMealList: Meals = Meals(meals: [Meal(id: "52898",
                                                         title: "Chelsea Buns",
                                                         thumbnail: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg"),
                                                    Meal(id: "52859",
                                                         title: "Key Lime Pie",
                                                         thumbnail: "https://www.themealdb.com/images/media/meals/qpqtuu1511386216.jpg")])

}

