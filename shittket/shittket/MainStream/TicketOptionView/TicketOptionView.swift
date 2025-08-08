//
//  TicketOptionView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  날짜/매수 선택 뷰

/*
 TODO
 커스텀 보안 키패드
 키패드 배열 랜덤화 로직
 날짜 입력칸 8자리 ____ __ __
 인풋 클리어
 모든 칸이 채워야지만 넘어갈 수 있음

 티켓 장수 선택
 선택된 숫자가 1이 아니면 넘어갈 수 없음

 두 섹션에 대해서 조건 미충족시 경고문구 표시
 다음 버튼 (배치는 아직 미정 툴바, 플로팅버튼 두 케이스 고려)
 뒤로 버튼 (갈 수 없음. 버튼만)
 */

import Foundation
import SwiftUI

struct TicketOptionView: View {
    @State private var contentDateRaw = ""
    @State private var ticketCount: Double = 10

    var body: some View {
        VStack(spacing: 32) {
            DatePickerView(dateInput: $contentDateRaw)

            TicketCounter(ticketCount: $ticketCount)

            Divider()

            HStack {
                Spacer()

                Text("1인 1매만 예매 가능합ㄴ디ㅏ")
            }

            Spacer()

            VStack {
                YesButCancelButton(action: {
                    print("")
                })
                LongTextButton()
            }
        }
    }
}

#Preview {
    TicketOptionView()
}
