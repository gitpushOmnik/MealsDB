//
//  MealDetailsViewModelTests.swift
//  MealsDBTests
//
//  Created by Omkar Nikhal on 7/8/24.
//

import XCTest
@testable import MealsDB

class MealDetailsViewModelTests: XCTestCase {
    
    var viewModel: MealDetailsViewModel!
    var networkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        viewModel = MealDetailsViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        viewModel = nil
        networkManager = nil
        super.tearDown()
    }
    
    func testFetchMealDetailsSuccess() async throws {
        // Arrange
        let mockMealDetails = MockData.testMealDetail
        networkManager.mockResult = .success(mockMealDetails)
        
        let expectation = XCTestExpectation(description: "Fetch meal details completed")
        
        // Act
        Task {
            await viewModel.fetchMealDetails(for: MockData.testMealID)
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5.0)
        
        XCTAssertNotNil(self.viewModel.mealDetails)
        XCTAssertEqual(self.viewModel.mealDetails?.id, mockMealDetails.meals?.first?.id)
    }

    
    
    func testFetchMealDetailsFailure() async throws {
        // Arrange
        networkManager.mockResult = .failure(MealsAPIError.requestFailed(message: "Test error"))
        
        let expectation = XCTestExpectation(description: "Fetch meal details completed")
        
        // Act
        Task {
            await viewModel.fetchMealDetails(for: MockData.testMealID)
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5.0)
        
        XCTAssertNil(self.viewModel.mealDetails)
    }
}
