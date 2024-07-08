//
//  MealsViewModelTests.swift
//  MealsDBTests
//
//  Created by Omkar Nikhal on 7/7/24.
//

import XCTest
@testable import MealsDB

class MealsViewModelTests: XCTestCase {
    
    var viewModel: MealsViewModel!
    var networkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        viewModel = MealsViewModel(networkManager: networkManager)
    }
    
    override func tearDown() {
        viewModel = nil
        networkManager = nil
        super.tearDown()
    }
    
    func testFetchMealsSuccess() async throws {
        // Arrange
        let mockMeals = MockData.testMealList
        networkManager.mockResult = .success(mockMeals)
        
        let expectation = XCTestExpectation(description: "Fetch meals completed")
        
        // Act
        Task {
            await viewModel.fetchMeals(for: "Dessert")
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5.0)
        
        // Assert
        XCTAssertNotNil(self.viewModel.meals)
        XCTAssertEqual(self.viewModel.meals?.count, mockMeals.meals?.count)
        XCTAssertEqual(self.viewModel.meals?.first?.id, mockMeals.meals?.first?.id)
    }
    
    func testFetchMealsFailure() async throws {
        networkManager.mockResult = .failure(MealsAPIError.requestFailed(message: "Test error"))
        
        let expectation = XCTestExpectation(description: "Fetch meals completed")
        
        // Act
        Task {
            await viewModel.fetchMeals(for: "Dessert")
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5.0)
        
        // Assert
        XCTAssertNil(self.viewModel.meals)
    }
}

