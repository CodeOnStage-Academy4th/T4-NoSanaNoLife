//
//  NumberPad.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  커스텀된 숫자패드
//  single digit을 반환, onTap에 키배열 shuffle

import Foundation
import SwiftUI

/// 실제 넘버패드 부분
struct NumberPad: View {
    var onTap: (String) -> Void
    var onDelete: () -> Void
    var onDone: () -> Void

    struct NumberItem: Identifiable, Hashable {
        let id = UUID()
        let value: String
    }

    @State private var numbers: [NumberItem] = Array(0...9).map {
        NumberItem(value: String($0))
    }

    private let numberColumns = Array(repeating: GridItem(.flexible()), count: 5)

    var body: some View {
        HStack(spacing: 12) {
            LazyVGrid(columns: numberColumns, spacing: 12) {
                ForEach(numbers) { item in
                    Button(action: {
                        onTap(item.value)
                        reshuffle() // 매번 랜덤이 되지 않게 하려면 이 시점에 분기 축
                    }) {
                        Text(item.value)
                            .font(.title)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(.clear)
                            .border(.primary, width: 1)
                    }
                }
            }

            VStack(spacing: 12) {
                Button(action: {
                    onDelete()
                    reshuffle()
                }) {
                    Image(systemName: "delete.left")
                        .frame(minWidth: 44, minHeight: 40)
                        .background(.clear)
                        .border(.primary, width: 1)
                }

                Button(action: {
                    onDone()
                }) {
                    Image(systemName: "keyboard.chevron.compact.down")
                        .frame(minWidth: 44, minHeight: 40)
                        .background(.clear)
                        .border(.primary, width: 1)
                }
            }
        }
        .onAppear {
            reshuffle()
        }
    }

    private func reshuffle() {
        var digits = Array(0...9).map { NumberItem(value: String($0)) }
        digits.shuffle()
        numbers = digits
    }
}

/// 모달로 띄우기 위해 분리
struct NumberPadSheetView: View {
    @Binding var input: String
    var onClose: () -> Void

    var body: some View {
        VStack {
            NumberPad(
                onTap: { digit in
                    if input.count < 8 {
                        input.append(digit)
                    }
                },
                onDelete: {
                    if !input.isEmpty {
                        input.removeLast()
                    }
                },
                onDone: {
//                    onClose()
                    
                }
            )
        }
        .padding(.horizontal)
        .presentationDragIndicator(.visible)
    }
}
