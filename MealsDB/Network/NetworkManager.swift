//
//  NetworkManager.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import Foundation

/// An API manager class responsible for handling meal data retrieval from a remote server.
class NetworkManager {

    /// Retrieves data asynchronously from a specified URL.
    /// - Parameter urlString: The URL string from which to retrieve data.
    /// - Returns: A result containing either the retrieved data or an error.
    private func callAPI(for urlString: String) async -> Result<Data, Error> {
        guard let url = URL(string: urlString) else { return .failure(MealsAPIError.invalidURL) }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard data.count != 0 else { return .failure(MealsAPIError.emptyResponse) }
            return .success(data)
        } catch {
            return .failure(MealsAPIError.requestFailed(message: error.localizedDescription))
        }
    }
    
    /// Retrieves and decodes data from a specified URL.
    /// - Parameter urlString: The URL string from which to retrieve data.
    /// - Returns: A result containing either the decoded data or an error.
    func retrieveData<T: Decodable>(_ urlString: String) async -> Result<T, Error> {
        let result = await callAPI(for: urlString)
        do {
            switch result {
            case .success(let data):
                let response = try JSONDecoder().decode(T.self, from: data)
                return .success(response)
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
}

enum MealsAPIError: Error {
    
    /// Error indicating that an empty response was received.
    case emptyResponse
    
    /// Error indicating that an invalid URL was provided.
    case invalidURL
    
    /// Error indicating that the request failed with a specific error message.
    case requestFailed(message: String)

    var description: String {
        switch self {
        case .emptyResponse:
            return "MealsAPI Error: Empty response received."
        case .invalidURL:
            return "MealsAPI Error: Invalid URL."
        case .requestFailed(let message):
            return "MealsAPI Error: Request failed with status code Message: \(message)"
        }
    }
}
