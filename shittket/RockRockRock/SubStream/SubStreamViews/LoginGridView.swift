//
//  LoginGridView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import SwiftUI

struct LoginGridView: View {
    let TotalButtons = 50
    let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 8),
        count: 4
    )

    @State private var KeyIndex = Int.random(in: 0..<50)

    var body: some View {
        Text("거기 너 당장 로 그 인 하라")
            .font(.title)

        Spacer()

        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(0..<TotalButtons) { index in
                    Button(action: {
                        if index == KeyIndex {
                            print("exit login View")
                        } else {
                           
                        }
                    }) {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 64, height: 64)
                            .overlay(
                                Text("\(index + 1)")
                            )
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginGridView()
}
