//
//  MealsListView.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

/// A view displaying a list of meals.
struct MealsListView: View {
    
    /// The array of meals to display in the list.
    let meals: [Meal]

    var body: some View {
        List(Array(meals.enumerated()), id: \.element.id) { index, meal in
            NavigationLink(destination: MealDetailsView(MealDetailsViewModel(), meal.id)) {
                MealRow(meal: meal)
            }
            .listRowBackground(index.isMultiple(of: 2) ? Color.gray.opacity(0.1) : Color.clear)
        }
        .scrollIndicators(.never)
        .listStyle(.plain)
        .navigationBarTitle(Constants.Strings.navigationBarTitle)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color(Constants.Strings.secondaryColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    MealsListView(meals: [])
}
