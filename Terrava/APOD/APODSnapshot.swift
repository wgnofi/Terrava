//
//  APODSnapshot.swift
//  Terrava
//
//  Created by Raghul A on 03/04/25.
//

import SwiftUI

struct APODSnapshot: Transferable {
    var image: Image
    var title: String
    var size =  CGSize(width: 300, height: 300)
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { ss in
            let uiImage = await MainActor.run {
                let snapshotContent = ss.snapshotView()
                let renderer = ImageRenderer(content: snapshotContent)
                renderer.scale = getScaleFor(size: ss.size)
                return renderer.uiImage
            }
            return uiImage?.pngData() ?? Data()
        }
    }
    
    private static func getScaleFor(size: CGSize) -> CGFloat {
        let desiredSize = 3000.0
        if size.width > size.height {
            return desiredSize / max(size.width, 300)
        } else {
            return desiredSize / max(size.height, 300)
        }

    }
    
    private func snapshotView() -> some View {
        VStack(alignment: .center) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
        }
    }
    
}
