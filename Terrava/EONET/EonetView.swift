//
//  EonetView.swift
//  Terrava
//
//  Created by Raghul A on 26/03/25.
//

import SwiftUI
import MapKit

struct EonetView: View {
    @EnvironmentObject var fetcher: EONETFetcher
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 66), span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: fetcher.events) { event in
                MapAnnotation(coordinate: event.location ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) {
                        EventButton(event: event)
                }
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarHidden(true)
        .task {
            do {
                try await fetcher.fetchEvents()
            } catch {
                print(error)
            }
        }
    }
}


