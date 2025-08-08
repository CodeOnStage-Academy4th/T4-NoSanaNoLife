//
//  ContentGridView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  홈그리드 뷰

import SwiftUI

struct ContentRowView: View {
    var body: some View {
        HStack {
            Image(.poster1)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Earth Rock\nExtravaganza")
                    .font(.wantedSans(.semiBold, size: 20))
                Text("07.26-28.2077")
                    .font(.wantedSans(.medium, size: 17))
            }
            .padding(10)
            
            Spacer()
            
            Button("예매하러가기") {
                
            }
            .buttonStyle(RowButtonStyle())
        }
    }
}

struct RowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .font(.wantedSans(.regular, size: 17))
            .background((Color(red: 0.75, green: 0.75, blue: 0.75)))
            .cornerRadius(20)
    }
}

#Preview {
    ContentRowView()
}
