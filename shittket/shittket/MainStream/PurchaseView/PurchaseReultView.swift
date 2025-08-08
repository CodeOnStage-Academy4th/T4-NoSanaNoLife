//
//  PurchaseReultView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  게임의 엔딩에 해당하는 뷰

import SwiftUI

struct PurchaseReultView: View {
    var body: some View {
        ScrollView{
            Text("결제가 완료되었습니다.")
//                .font(.wantedSemi32)
            Divider()
                .foregroundColor(.white)
            
            //TODO: 장황한 텍스트 입력하기
            
            Button(action: {
                
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
