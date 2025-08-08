//
//  LongTextButton.swift
//  shittket
//
//  Created by POS on 8/9/25.
//
// TODO: 폰트 및 폰트사이즈 적용. 스텍으로 분리된 문단 수정

import Foundation
import SwiftUI

struct LongTextButton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("불구하고 다음으로 넘어가고 싶으시다면, 저곳을 한번 눌러보는 시도를 해보시지 않겠습니까? 여기 말고 저기를 한번 눌러보면 어떨까요? 네, 이곳 문장에서 당신이 다음 페이지로 넘어가고 싶으시다면,")

            HStack(spacing: 0) {
                Text("여기")
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("TODO: goto next navigation path")
                    }

                Text("를 한번 눌러보는 시도를 해보시지 않겠습니까?")
            }

            Text("여기는 절대 누르지 않게 주의하세요. 당신이 원하는 답은 여기는 아닙니다.")
        }
        .font(.body)
        .foregroundColor(.gray)
        .padding()
    }
}

#Preview {
    LongTextButton()
}

