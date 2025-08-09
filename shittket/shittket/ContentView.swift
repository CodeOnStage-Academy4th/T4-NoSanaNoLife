//
//  ContentView.swift
//  shittket
//
//  Created by POS on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var eventManager: EventManager
    
    var body: some View {
        ContentListView()
            .screenFlip(
                horizontal: eventManager.HorizontalFlip,
                vertical: eventManager.VerticalFlip
            )
    }
}

//#Preview {
//    ContentView()
//}
