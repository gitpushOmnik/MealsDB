//
//  MockNetworkManager.swift
//  MealsDBTests
//
//  Created by Omkar Nikhal on 7/7/24.
//

import Foundation
@testable import MealsDB

class MockNetworkManager: NetworkManager {
    var mockResult: Result<Any, Error>?

    override func retrieveData<T: Decodable>(_ urlString: String) async -> Result<T, Error> {
        guard let mockResult = mockResult else {
            return .failure(MealsAPIError.requestFailed(message: "No mock result set"))
        }

        switch mockResult {
        case .success(let value):
            if let castedValue = value as? T {
                return .success(castedValue)
            } else {
                return .failure(MealsAPIError.requestFailed(message: "Mock value type mismatch"))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
