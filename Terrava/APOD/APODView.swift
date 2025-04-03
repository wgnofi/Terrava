//
//  APODView.swift
//  Terrava
//
//  Created by Raghul A on 25/03/25.
//

import SwiftUI

struct APODView: View, Sendable {
    
    @EnvironmentObject var fetcher: APODFetcher
    @State private var apodImage: Image?
    @State private var errorMessage = ""
    @State private var canShowDetails: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                if canShowDetails {
                    Text(fetcher.imageData?.title ?? "Astronomy Picture of the Day")
                        .font(.largeTitle).padding(.bottom)
                }
                
                AsyncImage(url: fetcher.imageData?.hdurl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .animation(.default, value: image)
                            .accessibilityLabel(Text(fetcher.imageData?.title ?? "APOD"))
                            .task {
                                canShowDetails = true
                            }
                        let _ = cacheImage(image)
                    } else if phase.error != nil {
                        VStack {
                            Text("Error in Loading the Image")
                                .font(.title2)
                        }
                    } else {
                        ProgressView()
                    }
                    
                }
                .frame(minHeight: 150)
                .padding(.horizontal)
                
                if canShowDetails {
                    Text(fetcher.imageData?.explanation ?? "No description").font(.title3)
                        .padding()
                }
            }
            .task {
                do {
                    try await fetcher.fetchAPODData()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
        }
        .navigationTitle("APOD")
        .toolbar(content: {
            ShareLink(
                item: snapshot,
                preview: SharePreview("APOD", image: snapshot)
            )
        })
    }
    
    private func cacheImage(_ image: Image) -> Bool {
        apodImage = image
        return true
    }
    
    var snapshot: APODSnapshot {
        APODSnapshot(image: apodImage ?? Image("placeholder"), title: "Astronomty Picture of the Day")
    }
}

