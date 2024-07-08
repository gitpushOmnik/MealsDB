//
//  MealsViewModel.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

/// A view model class responsible for managing meal data.
class MealsViewModel: ObservableObject {
    
    /// Published property to hold the list of meals.
    @Published var meals: [Meal]?
    
    /// The API manager for retrieving meals data.
    let networkManager: NetworkManager

    /// Initializes the view model with an optional custom API manager.
    /// - Parameter networkManager: The meals API manager. Defaults to `NetworkManager()`.
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
   
    /// Fetches meals data for a specified category asynchronously.
    /// - Parameter category: The category of meals to fetch.
    func fetchMeals(for category: String) async {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.mealCategoryFilter + category
        let response: Result<Meals, Error> = await networkManager.retrieveData(urlString)

        switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.meals = data.meals?.sorted { $0.title < $1.title } ?? []
                }
                
            case .failure(let error):
                print("Error occured while fetching API Response. \(error.localizedDescription)")
        }
    }
}
