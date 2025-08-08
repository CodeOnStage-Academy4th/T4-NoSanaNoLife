//
//  InfoRowView.swift
//  shittket
//
//  Created by yunsly on 8/9/25.
//

import SwiftUI

struct InfoRowView: View {
    let label: String
    let value: String
    var valueColor: Color = .primary
    var isBold: Bool = false
    var isStrikethrough: Bool = false
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Text(value)
                .foregroundColor(valueColor)
                .strikethrough(isStrikethrough, color: .black)
        }
        .padding(.vertical, 8)
    }
}
