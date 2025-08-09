//
//  YesButCancel.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

struct YesButCancelButton: View {
    let title: String = "Yes"
    let subtitle: String = "but cancel"
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(title)
                    .font(.wantedSemi20)
//                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.wantedReg10)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(10)
            .frame(width: 352, height: 180, alignment: .center)
            .background(.maincolor)
            .cornerRadius(90)
        }
    }
}

#Preview {
    YesButCancelButton(action: {
        print("")
    })
}
