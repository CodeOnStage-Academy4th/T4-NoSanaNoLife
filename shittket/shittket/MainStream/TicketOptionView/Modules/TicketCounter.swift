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
            Slider(value: $ticketCount, in: 1...99, step: 1)
            HStack {
                Text("인원 수")
                Spacer()
                Text("\(Int(ticketCount))인")
            }
        }
    }
}
