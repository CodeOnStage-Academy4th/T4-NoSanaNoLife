//
//  ContactInfoView.swift
//  shittket
//
//  Created by yunsly on 8/9/25.
//

import SwiftUI

struct ContactInfoView: View {
    @Binding var isContactcompleted: Bool
    
    
    @State private var digits: [String] = Array(repeating: "", count: 11)
    @State private var isShowingNumberPad = false
    @State private var selectedIndex: Int?
    
    init(isContactcompleted: Binding<Bool> = .constant(true)) {
        _isContactcompleted = isContactcompleted
    }
    
    var body: some View {
        VStack {
            
            
            HStack(spacing: 8) {
                Text("전화번호")
                    .fontWeight(.bold)
                Text("*")
                    .foregroundColor(.red)
                Spacer()
                // 0부터 10까지 11개의 뷰를 반복 생성
                ForEach(0..<11, id: \.self) { index in
                    
                    // 4번째와 8번째는 비활성 원(구분자)으로 표시
                    if index == 3 || index == 7 {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 16, height: 16)
                    } else {
                        // 그 외에는 활성 원(버튼)으로 표시
                        ZStack {
                            Circle()
                                .fill(Color.green.opacity(0.4))
                                .frame(width: 16, height: 16)
                            
                            Text(digits[index])
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
                            // 탭했을 때, 어떤 원이 선택되었는지 인덱스를 저장하고 모달을 켬
                            self.selectedIndex = index
                            self.isShowingNumberPad = true
                        }
                    }
                }
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        .sheet(isPresented: $isShowingNumberPad) {
            // numberPad 연결
        }
    }
}

#Preview {
    ContactInfoView()
}
