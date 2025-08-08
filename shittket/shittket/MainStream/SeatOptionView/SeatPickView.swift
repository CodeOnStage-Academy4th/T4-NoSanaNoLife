//
//  SeatOptionView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  좌석 선택 뷰

import SwiftUI

struct SeatPickView: View {
    let answerSeat = Seat(teamNum: 8, seatNum: 2, x: 188, y: 287)
    
    let seats = [
        Seat(teamNum: 7, seatNum: 1, x: 92, y: 265),
        Seat(teamNum: 7, seatNum: 2, x: 60, y: 283),
        Seat(teamNum: 7, seatNum: 3, x: 90, y: 300),
        Seat(teamNum: 7, seatNum: 4, x: 30, y: 315),
        Seat(teamNum: 7, seatNum: 5, x: 62, y: 298),
        Seat(teamNum: 7, seatNum: 6, x: 60, y: 332),
        
        Seat(teamNum: 8, seatNum: 1, x: 157,  y: 268),
        Seat(teamNum: 8, seatNum: 2, x: 188, y: 287),
        Seat(teamNum: 8, seatNum: 3, x: 158, y: 303),
        Seat(teamNum: 8, seatNum: 4, x: 200, y: 270),
        Seat(teamNum: 8, seatNum: 5, x: 198, y: 307),
        Seat(teamNum: 8, seatNum: 6, x: 227, y: 290),
    ]
    
    @State private var selectedSeat: Seat? = nil
    
    var body: some View {
        ZStack {
            Image(.seats)
                .resizable()
                .scaledToFit()
                .grayscale(0.5)
            
            ForEach(seats) { seat in
                Button(action: {
                    selectSeat(seat)
                }) {
                    Rectangle()
                        .foregroundStyle(seatColor(seat))
                        .frame(width: 10, height: 10)
                }
                .position(x: seat.x, y: seat.y)
            }
        }
    }
    
    private func seatColor(_ seat: Seat) -> Color {
        if seat == selectedSeat {
            return Color.gray
        }
        
        if seat == answerSeat {
            return Color(red: 0.46, green: 0.92, blue: 0.43)
        }
        
        return Color(red: 0.52, green: 0.92, blue: 0.49)
    }
    
    private func selectSeat(_ seat: Seat) {
        if selectedSeat == seat {
            selectedSeat = nil
        } else {
            selectedSeat = seat
        }
    }
}

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

#Preview {
    SeatPickView()
}
