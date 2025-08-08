//
//  DatePicker.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @EnvironmentObject var eventManager: EventManager
    
    @Binding var dateInput: String
    @State private var showPad = false

    var isFilled: Bool {
        dateInput.count == 8
    }

    var body: some View {
        VStack(spacing: 12) {
            Button(action: {
                if Double.random(in: 0...1) < 0.8 { // 화면 뒤집기 트리거 확률
                                    eventManager.triggerScreenFlip()
                                }
                showPad = true
            }) {
                VStack(alignment: .leading) {
                    Text("날짜")

                    HStack(spacing: 8) {
                        ForEach(0..<8) { index in
                            let char =
                                dateInput.count > index
                                ? String(
                                    dateInput[
                                        dateInput.index(
                                            dateInput.startIndex,
                                            offsetBy: index
                                        )
                                    ]
                                )
                                : ""

                            ZStack {
                                Rectangle()
                                    .foregroundColor(.primary)
                                    .frame(
                                        width: 36,
                                        height: 36,
                                        alignment: .center
                                    )
                                    .cornerRadius(8)
                                if char.isEmpty {
                                    Image("lock-04")
                                } else {
                                    Text(char)
                                        .foregroundColor(Color.white)
                                }
                            }

                            if index == 3 || index == 5 {
                                Text(".").frame(width: 8)
                            }
                        }
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .sheet(isPresented: $showPad) {
            NumberPadSheetView(
                input: $dateInput,
                onClose: {
                    showPad = false
                }
            )
            // 모달시트 높이
            .presentationDetents([.fraction(0.8)])
        }
    }
}
