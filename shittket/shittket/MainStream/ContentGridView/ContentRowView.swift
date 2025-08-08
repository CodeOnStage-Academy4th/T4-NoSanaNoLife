//
//  ContentGridView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  홈그리드 뷰

import SwiftUI

struct ContentRowView: View {
    let contentRow: FestivalCard
    var disabled = false
    
    var body: some View {
        HStack {
            Image(contentRow.imageReSource)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(contentRow.name)
                    .font(.wantedSans(.semiBold, size: 20))
                Text(contentRow.dateInfo)
                    .font(.wantedSans(.medium, size: 17))
            }
            .padding(10)
            
            Spacer()
            
            Button("예매하러가기") {
                
            }
            .buttonStyle(RowButtonStyle())
            .disabled(disabled)
        }
    }
}

struct RowButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .font(.wantedSans(.regular, size: 17))
            .foregroundStyle(configuration.isPressed ? .black.opacity(0.3) : foregroundStyle)
            .background(backgroundColor)
            .cornerRadius(20)
    }
    
    private var foregroundStyle: Color {
        if isEnabled {
            Color.black
        } else {
            Color(red: 0.64, green: 0.64, blue: 0.64)
        }
    }
    
    private var backgroundColor: Color {
        if isEnabled {
            Color(red: 0.75, green: 0.75, blue: 0.75)
        } else {
            Color(red: 0.83, green: 0.83, blue: 0.83)
        }
    }
}

#Preview {
    ContentRowView(contentRow: festivalCards[0])
    ContentRowView(contentRow: festivalCards[0], disabled: true)
}
