//
//  EventButton.swift
//  Terrava
//  Created by Raghul A on 03/04/25.
//

import SwiftUI

struct EventButton: View {
    var event: Event
    
    @State private var isShowingPopover = false
    @State private var popoverSize = CGSize(width: 300, height: 300)
    
    var body: some View {
        Button(action: {
            isShowingPopover = true
        }, label: {
            Image(systemName: "mappin.and.ellipse.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .red)
                .font(isShowingPopover ? .title : .body)
                .animation(.easeInOut(duration: 0.2), value: isShowingPopover)
        })
        .popover(isPresented: $isShowingPopover) {
            EventPopoverView(name: event.title, category: event.categories.first?.title ?? "No Category", size: $popoverSize)
                .presentationDetents([.height(popoverSize.height)])
        }
    }
}

