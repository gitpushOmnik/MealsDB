//
//  HomeScreenView.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

/// A view representing the list of meals in the Meals app.
struct HomeScreenView: View {
    
    /// Observed object for managing meals data.
    @ObservedObject var mealsViewModel: MealsViewModel
    
    /// Observed object for managing meal details data.
    @ObservedObject var mealDetailsViewModel: MealDetailsViewModel
    
    /// Initializes the MealsListView with the specified view models.
    /// - Parameters:
    ///   - mealsViewModel: The view model for managing meals data.
    ///   - mealDetailsViewModel: The view model for managing meal details data.
    init(_ mealsViewModel: MealsViewModel, _ mealDetailsViewModel: MealDetailsViewModel) {
        self.mealsViewModel = mealsViewModel
        self.mealDetailsViewModel = mealDetailsViewModel
    }
    
    var body: some View {
        NavigationStack {
            if let meals = mealsViewModel.meals {
                if meals.isEmpty {
                    Text(Constants.Strings.noItems)
                } else {
                    MealsListView(meals: meals)
                }
            } else {
                ProgressView(Constants.Strings.loading)
                    .frame(alignment: .center)
                    .navigationBarTitle(Constants.Strings.navigationBarTitle)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(Color(Constants.Strings.secondaryColor), for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
        }
        .task {
            await mealsViewModel.fetchMeals(for: Constants.Strings.dessert)
        }
    }
}

#Preview {
    HomeScreenView(MealsViewModel(), MealDetailsViewModel())
}
