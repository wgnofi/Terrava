//
//  EONET.swift
//  Terrava
//
//  Created by Raghul A on 03/04/25.
//

import CoreLocation
import MapKit

struct EONET: Codable {
    var title: String
    var description: String
    var events: [Event]
}

struct Event: Identifiable ,Codable {
    var id: String
    var title: String
    var categories: [Categories]
    var geometry: [Geomet]
    

    var location: CLLocationCoordinate2D? {
        // guard checks if there is a first geometry or it returns nil
        guard let firstGeometry = geometry.first, let coordinates = firstGeometry.coordinates,
              //checks if the retrieved coordinate is a valid one in the map
                CLLocationCoordinate2DIsValid(CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0]))
        else { return nil }
        
        return CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
    }
}

struct Categories: Identifiable ,Codable {
    var id: String
    var title: String
}

struct Geomet: Codable {
    var date: String
    var coordinates: [Double]?
}

