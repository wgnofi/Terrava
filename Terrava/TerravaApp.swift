//
//  TerravaApp.swift
//  Terrava
//
//  Created by Raghul A on 25/03/25.
//

import SwiftUI
import SwiftData

@main
struct TerravaApp: App {
    
    @StateObject private var apodFetcher = APODFetcher()
    @StateObject private var eonetFetcher = EONETFetcher()
    

    var body: some Scene {
        WindowGroup {
            ContentView(apodFetcher: apodFetcher, eonetFetcher: eonetFetcher)
        }
        
    }
}
