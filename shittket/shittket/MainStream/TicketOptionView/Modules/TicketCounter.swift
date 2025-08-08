//
//  TicketCounter.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

struct TicketCounter: View {
    @Binding var ticketCount: Double

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("인원 수")
                Spacer()
                Text("\(Int(ticketCount))인")
            }

            HStack {
                Image(systemName: "tortoise.fill")
                Slider(value: $ticketCount, in: 1...99, step: 1)
                Image(systemName: "hare.fill")
            }
        }
    }
}
