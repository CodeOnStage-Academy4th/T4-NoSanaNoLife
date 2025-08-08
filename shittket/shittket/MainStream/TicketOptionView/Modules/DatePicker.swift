//
//  DatePicker.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    @Binding var dateInput: String
    @State private var showPad = false

    var isFilled: Bool {
        dateInput.count == 8
    }

    var body: some View {
        VStack(spacing: 12) {
            Button(action: {
                showPad = true
            }) {
                VStack(alignment: .leading) {
                    Text("날짜")

                    HStack(spacing: 8) {
                        ForEach(0..<8) { index in
                            let char = dateInput.count > index
                                ? String(dateInput[dateInput.index(dateInput.startIndex, offsetBy: index)])
                                : ""

                            ZStack {
                                Rectangle()
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(height: 40)
                                Text(char)
                                    .font(.title3)
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
            // 버튼의 높이
            .presentationDetents([.fraction(0.3)])
        }
    }
}

