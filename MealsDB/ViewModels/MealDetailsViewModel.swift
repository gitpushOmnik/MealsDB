//
//  MealDetailsViewModel.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

/// A view model class responsible for managing meal details data.
class MealDetailsViewModel: ObservableObject {
    
    /// Published property to hold the meal details.
    @Published var mealDetails: MealDetail?
    
    /// The API manager for retrieving meal details data.
    private let networkManager: NetworkManager

    /// Initializes the view model with an optional custom API manager.
    /// - Parameter networkManager: The meals API manager. Defaults to `NetworkManager()`.
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    /// Fetches meal details data for a specified meal ID asynchronously.
    /// - Parameter mealID: The ID of the meal to fetch details for.
    func fetchMealDetails(for mealID: String) async {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.categoryDetailsFilter + mealID
        let response: Result<MealDetails, Error> = await networkManager.retrieveData(urlString)
        
        switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.mealDetails = data.meals?.first
                }
                
            case .failure(let error):
                print("Error occured while fetching API Response. \(error.localizedDescription)")
        }
    }
}

