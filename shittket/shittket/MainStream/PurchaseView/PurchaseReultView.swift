//
//  PurchaseReultView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  게임의 엔딩에 해당하는 뷰

import SwiftUI

struct PurchaseReultView: View {
    private let quotes: [String] = [
        "인간은 다른 사람처럼 되고자 하기에 자기 잠재력의 4분의 3을 상실한다.",
        "불행은 결코 우리의 행복을 감소시킬 수 없다",
        "당신이 가는 길이 힘들다면, 아마 그 길이 맞는 길일 것이다.",
        "작은 일에 평온을 느끼는 것이야말로, 결코 작은 일이 아니다.",
        "당신을 괴롭히는 것은 외부에서 벌어지는 사건이 아니다. 그 사건에 대한 당신의 생각이 괴로움의 원인이다.",
        "마음을 다스릴 수 있는 사람만이 진짜로 자유로운 사람이다.",
        "내면의 평온을 얻는 사람은 어떤 외부의 일에도 흔들리지 않는다.",
        "과거의 일도, 미래의 일도 너를 해칠 수 없다. 오직 현재의 일만이 너를 상처줄 수 있다. 그러나 그것조차도 정확히 바라보면 두려움이 사라진다.",
        "현재의 우리는 우리가 반복적으로 하는 행동의 결과이다.",
        "UI는 자유롭도록 선고받았다.",
        "UX는 지옥이다.",
        "만약 UX가 존재하지 않는다면, 모든 것이 허용된다.",
        "UI는 UX로 태어나는 것이 아니라 UX로 만들어지는 것이다.",
    ]
    var body: some View {
        ScrollView {
            Text("결제가 완료되었습니다.")
            //                .font(.wantedSemi32)
            Divider()
                .foregroundColor(.white)

            //TODO: 장황한 텍스트 입력하기
            VStack(alignment: .leading, spacing: 16) {
                ForEach(quotes.indices, id: \.self) { i in
                    Text("\"\(quotes[i])\"")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(17)
            
            
            Button(action: {
                exit(0)
            }) {
                Text("종료하기")
            }
        }
        //        .background(.Back2)
        .navigationTitle("결제 완료")
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    PurchaseReultView()
}
