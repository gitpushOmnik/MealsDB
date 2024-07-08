//
//  MealsDBApp.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

@main
struct MealsDBApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView(mealsViewModel: MealsViewModel(), mealDetailsViewModel: MealDetailsViewModel())
        }
    }
}
