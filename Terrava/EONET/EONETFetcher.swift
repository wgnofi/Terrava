//
//  EONETFetcher.swift
//  Terrava
//
//  Created by Raghul A on 03/04/25.
//

import Foundation
import CoreLocation
import MapKit

class EONETFetcher: ObservableObject {
    
    @Published var events: [Event] = []
    
    // data fetched in the last 10 days
    let urlString = "https://eonet.gsfc.nasa.gov/api/v3/events?days=10"
    
    enum FetchError: Error {
        case noResponse
        case failedRequest(statusCode: Int)
        case badJSON(error: Error)
    }
    
    func fetchEvents() async throws {
        // checks if it can create an url from the string, if it cannot it will exit immediately without executing further code below
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // if there is no http response
        guard let response = response as? HTTPURLResponse else { throw FetchError.noResponse }
        
        // if it is a http response, is it ok (200) else return the status code
        guard response.statusCode == 200 else { throw FetchError.failedRequest(statusCode: response.statusCode) }
        
        
        do {
            // decode from EONET not Event
            let decodedEvents = try JSONDecoder().decode(EONET.self, from: data)
            // now run in this main thread so it affects the ui with effect its an async operation
            await MainActor.run {
                // as we know decodedEvents is an EONET so we are assigning its events to our published variable
                events = decodedEvents.events
            }
        } catch {
                throw FetchError.badJSON(error: error)
        }
    }
}
