//
//  FontDebugging.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import SwiftUI

struct FontDebugging: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Group {
                Text("SemiBold 32")
                    .font(.wantedSemi32)

                Text("SemiBold 20")
                    .font(.wantedSemi20)

                Text("SemiBold 17")
                    .font(.wantedSemi17)

                Text("SemiBold 10")
                    .font(.wantedSemi10)
            }

            Divider()

            Group {
                Text("Regular 48")
                    .font(.wantedReg48)

                Text("Regular 17")
                    .font(.wantedReg17)

                Text("Regular 10")
                    .font(.wantedReg10)
            }

            Divider()

            Group {
                Text("Medium 48")
                    .font(.wantedMed48)

                Text("Medium 24")
                    .font(.wantedMed24)

                Text("Medium 17")
                    .font(.wantedMed17)

                Text("Medium 10")
                    .font(.wantedMed10)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        FontDebugging()
    }
}
