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
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)

    }

//    var body: some View {
//        TicketOptionView()
//            .screenFlip(
//                horizontal: eventManager.HorizontalFlip,
//                vertical: eventManager.VerticalFlip
//            )
//    }
}

#Preview {
    ContentView()
}
