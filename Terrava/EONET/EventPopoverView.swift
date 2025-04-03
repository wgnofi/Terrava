//
//  EventPopoverView.swift
//  Terrava
//
//  Created by Raghul A on 03/04/25.
//

import SwiftUI

struct EventPopoverView: View {
    
    var name: String
    var category: String
    
    @Binding var size: CGSize
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack (alignment: .top) {
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                          
                Circle()
                    .fill(Color(uiColor: .tertiarySystemFill))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .font(.callout.weight(.bold))
                            .foregroundStyle(.secondary)
                    )
                    .onTapGesture {
                        dismiss()
                    }
            }
            Text("Category: \(category)")
        }
    }
}

//#Preview {
//    EventPopoverView()
//}
