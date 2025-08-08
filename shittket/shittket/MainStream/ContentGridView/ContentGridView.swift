//
//  ContentGridView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  홈그리드 뷰

import SwiftUI

struct ContentGridView: View {
    var body: some View {
        HStack {
            Image(.poster1)
            
            VStack {
                Text("Earth Rock\nExtravaganza")
                    .font(.wantedSans(.semiBold, size: 20)
                )
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    ContentGridView()
}
