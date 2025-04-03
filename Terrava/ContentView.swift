//
//  ContentView.swift
//  Terrava
//
//  Created by Raghul A on 25/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @ObservedObject var apodFetcher: APODFetcher
    @ObservedObject var eonetFetcher: EONETFetcher

    var body: some View {
        TabView {
            NavigationStack {
                APODView()
            }
            .environmentObject(apodFetcher)
            .tabItem {
                Label("APOD", systemImage: "globe.desk")
            }
            NavigationStack {
                EonetView()
            }
            .environmentObject(eonetFetcher)
            .tabItem {
                Label("EONET", systemImage: "globe.americas")
            }
        }
    }
}

#Preview {
    ContentView(apodFetcher: APODFetcher(), eonetFetcher: EONETFetcher())
}
