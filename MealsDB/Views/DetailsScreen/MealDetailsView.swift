//
//  MealDetailsView.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

/// A view displaying details of a specific meal.
struct MealDetailsView: View {
    
    /// Observed object for managing meal details data.
    @ObservedObject var mealDetailsViewModel: MealDetailsViewModel
    
    /// The ID of the meal to display details for.
    let mealID: String
    
    /// Initializes the MealDetailsView with the provided view model and meal ID.
    /// - Parameters:
    ///   - mealDetailsViewModel: The view model for managing meal details data.
    ///   - mealID: The ID of the meal to display details for.
    init(_ mealDetailsViewModel: MealDetailsViewModel, _ mealID: String) {
        self.mealDetailsViewModel = mealDetailsViewModel
        self.mealID = mealID
    }
    
    var body: some View {
        ZStack {
            Color(Constants.Strings.primaryColor)
                .edgesIgnoringSafeArea(.all)
            
            if let details = mealDetailsViewModel.mealDetails {
                ScrollView {
                    VStack(spacing: Constants.Spacings.mealDetailsVertical) {
                        MealBanner(details: details)
                        MealInstructions(instructions: details.instructions)
                        MealIngredients(ingredients: details.ingredients, measurements: details.measurements)
                    }
                    .padding()
                }
                .scrollIndicators(.never)
            }else {
                ProgressView(Constants.Strings.loading)
                    .frame(alignment: .center)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color(Constants.Strings.secondaryColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .task {
            await mealDetailsViewModel.fetchMealDetails(for: mealID)
        }
    }
}

#Preview {
    MealDetailsView(MealDetailsViewModel(), "52969")
}

