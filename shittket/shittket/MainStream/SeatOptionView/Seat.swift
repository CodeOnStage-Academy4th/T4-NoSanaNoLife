//
//  Seat.swift
//  shittket
//
//  Created by oliver on 8/9/25.
//


import SwiftUI

struct Seat: Identifiable, Equatable {
    let teamNum: Int
    let seatNum: Int
    let x: CGFloat
    let y: CGFloat
    
    var id: String {
        "\(teamNum)-\(seatNum)"
    }
    
    static func == (lhs: Seat, rhs: Seat) -> Bool {
        lhs.id == rhs.id
    }
}