//
//  ContentListView.swift
//  shittket
//
//  Created by oliver on 8/9/25.
//

import SwiftUI

struct ContentListView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(festivalCards) { card in
                    VStack(spacing: 12) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 1)
                            .background(Color(red: 0.86, green: 0.86, blue: 0.86))
                        ContentRowView(contentRow: card)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("페스티벌 둘러보기")
                        .font(.wantedSans(.semiBold, size: 20))
                }
            }
        }
    }
}

#Preview {
    ContentListView()
}
