//
//  APODFetcher.swift
//  Terrava
//
//  Created by Raghul A on 25/03/25.
//

import SwiftUI

class APODFetcher: ObservableObject {
    
    @Published var imageData: APOD? = nil
    
    // REPLACE WITH YOUR API KEY
    
    let urlString = "https://api.nasa.gov/planetary/apod?api_key=YOUR_API_KEY"
    
    enum FetchError: Error, LocalizedError {
        case badResponse
        case failedRequest(status: Int)
        case badJSON(error: Error)
        
        public var errorDescription: String? {
            switch self {
                case .badResponse:
                    return "Bad response from the server."
                case .failedRequest(status: let status):
                    return "Request failed with status: \(status)."
                case .badJSON(error: let error):
                    return "Failed to parse JSON: \(error.localizedDescription)."
            }
        }
    }
    
    func fetchAPODData() async throws {
        guard let url = URL(string: urlString) else { return }
        
        // URLRequest lets you customise the request, URLSession.shared.data(from: url) also does the same thing but its just limited to simple GET request
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        // is the response a http response?
        
        guard let response = response as? HTTPURLResponse else {
            throw FetchError.badResponse
        }
        
        // and is the http response status code is OK?
        
        guard response.statusCode == 200 else {
            throw FetchError.failedRequest(status: response.statusCode)
        }
        
        // UI Updates must be run in main thread, to avoid race conditions where in main thread it should not assign the published image without loading it
        
        try await MainActor.run {
            do {
                imageData = try JSONDecoder().decode(APOD.self, from: data)
            } catch {
                throw FetchError.badJSON(error: error)
            }
        }
        
    }
}

extension APODFetcher: @unchecked Sendable {}
