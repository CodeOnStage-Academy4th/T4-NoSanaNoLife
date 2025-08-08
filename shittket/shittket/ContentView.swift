//
//  ContentView.swift
//  shittket
//
//  Created by POS on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    //    var body: some View {
    //        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    //
    //
    //    }
    @EnvironmentObject var eventManager: EventManager

    var body: some View {
        TicketOptionView()
            .screenFlip(
                isActive: eventManager.isScreenFlipped,
                direction: eventManager.flipDirection
            )
    }
}

#Preview {
    ContentView()
}
