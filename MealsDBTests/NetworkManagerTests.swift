//
//  NetworkManagerTests.swift
//  MealsDBTests
//
//  Created by Omkar Nikhal on 7/7/24.
//

import XCTest
@testable import MealsDB

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        networkManager = NetworkManager()
    }

    override func tearDownWithError() throws {
        networkManager = nil
    }

    func testRetrieveMealsSuccess() async {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.mealCategoryFilter + MockData.category
        let result: Result<Meals, Error> = await networkManager.retrieveData(urlString)
        
        switch result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("Failed to retrieve meals with error: \(error.localizedDescription)")
        }
    }

    func testRetrieveMealDetailsSuccess() async {
        let urlString = Constants.Network.apiBaseURL + Constants.Network.categoryDetailsFilter + MockData.testMealID
        let result: Result<MealDetails, Error> = await networkManager.retrieveData(urlString)
                
        switch result {
        case .success(let data):
            XCTAssertNotNil(data)
        case .failure(let error):
            XCTFail("Failed to retrieve meal details with error: \(error.localizedDescription)")
        }
    }

    func testRetrieveDataWithInvalidURL() async {
        let urlString = "invalidURL"
        let result: Result<MealDetails, Error> = await networkManager.retrieveData(urlString)
        
        switch result {
        case .success:
            XCTFail("Should fail with invalid URL.")
        case .failure(let error):
            XCTAssertNotNil(error)
        }
    }
}
