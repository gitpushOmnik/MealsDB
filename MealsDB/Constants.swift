//
//  Constants.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

enum Constants {
    enum Network {
        static let apiBaseURL = "https://themealdb.com/api/json/v1/1/"
        static let mealCategoryFilter = "filter.php?c="
        static let categoryDetailsFilter = "lookup.php?i="
    }
    
    enum Strings {
        static let primaryColor = "primaryTextColor"
        static let secondaryColor = "secondaryTextColor"
        static let splashScreenTitle = "The Meals DB"
        static let noItems = "No items"
        static let forkKnifeIcon = "fork.knife"
        static let navigationBarTitle = "Meals DB"
        static let dessert = "Dessert"
        static let instructions = "Instructions"
        static let ingredients = "Ingredients"
        static let measurements = "Measurements"
        static let loading = "Loading"
    }
    
    enum Regex {
        static let escapePattern = #"(\\[^\n\r\t\\'"])"#
        static let spacePattern = #"\s+"#
        static let parenthesisPattern = "(?<!\\()\\b\\d+\\)"
    }
    
    enum Sizes {
        static let splashScreenText = 45.0
        static let splashScreenImage = 100.0
        static let mealRowImageSize = 70.0
        static let mealRowCornerRadius = 10.0
        static let titleScaleFactor = 0.5
        static let detailsImageOpacity = 0.8
        static let instructionsBgOpacity = 0.1
        static let titleSize = 28.0
        static let detailsImageCornerRadius = 20.0
        static let detailsTitleOpacity = 0.4
        static let ingredientsWidth = 300.0
        static let mainTitleSize = 32.0
    }
    
    enum Spacings {
        static let mealDetailsVertical = 20.0
        static let mealRowHorizontal = 15.0
    }
    
    enum Paddings {
        static let mealRowVertical = 8.0
        static let detailsTitleBottom = 30.0
        static let detailsTitle = 10.0
        static let instructionVertical = 20.0
        static let ingredientsVertical = 20.0
        static let instructionRow = 10.0
        static let instructionRowTop = 15.0
    }
    
    enum Delays {
        static let splashScreenDelay = 2.5
    }
}
