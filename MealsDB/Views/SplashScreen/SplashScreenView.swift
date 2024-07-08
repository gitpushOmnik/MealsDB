//
//  SplashScreenView.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

/// A view representing the splash screen of the Meals app.
struct SplashScreenView: View {
    
    /// State variable to track the activation of the home screen.
    @State private var isHomeScreenActive = false
    
    /// The view model for managing meals data.
    @StateObject var mealsViewModel: MealsViewModel
    
    /// The view model for managing meal details data.
    @StateObject var mealDetailsViewModel: MealDetailsViewModel
    
    var body: some View {
        ZStack {
            if self.isHomeScreenActive {
                HomeScreenView(mealsViewModel, mealDetailsViewModel)
            }
            else {
                SplashScreenText()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Delays.splashScreenDelay) {
                self.isHomeScreenActive = true
            }
        }
    }
}

#Preview {
    SplashScreenView(mealsViewModel: MealsViewModel(),
                     mealDetailsViewModel: MealDetailsViewModel())
}


