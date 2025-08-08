//
//  SeatOptionView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  좌석 선택 뷰

import SwiftUI

struct SeatPickView: View {
    let seats = [
        Seat(id: 1, x: 100, y: 100, isSelected: true),
        Seat(id: 2, x: 200, y: 100, isSelected: false),
        Seat(id: 3, x: 300, y: 100, isSelected: false),
    ]
    
    var body: some View {
        ZStack {
            Image(.seats)
                .resizable()
                .scaledToFit()
                .grayscale(1)
            
            ForEach(seats) { seat in
                Button(action: {
                }) {
                    Rectangle()
                        .foregroundStyle(seat.isSelected ? .blue : .red)
                        .frame(width: 10, height: 10)
                }
                .position(x: seat.x, y: seat.y)
            }
        }
    }
}

struct Seat: Identifiable {
    let id: Int
    let x: CGFloat
    let y: CGFloat
    var isSelected: Bool
}

#Preview {
    SeatPickView()
}
