//
//  ContactInfoView.swift
//  shittket
//
//  Created by yunsly on 8/9/25.
//

import SwiftUI

struct ContactInfoView: View {
    @Binding var isContactcompleted: Bool
    
    @State private var phone: String = ""
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
                            
                            Text(digitAt(phone, index))
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
            if let index = selectedIndex {
                NumberPadSheetView(
                    input: bindingForIndex(index),
                    onClose: {
                        isShowingNumberPad = false
                    }
                )
                .presentationDetents([.fraction(0.8)])
            }
        }
    }
}

private func digitAt(_ phone: String, _ index: Int) -> String {
    let arr = toDigitsArray(phone)
    return arr[index]
}

private func toDigitsArray(_ phone: String) -> [String] {
    var arr = Array(repeating: "", count: 11)
    let digitsOnly = phone.filter { $0.isNumber }
    for (i, ch) in digitsOnly.enumerated() where i < 11 {
        arr[i] = String(ch)
    }
    return arr
}

private func fromDigitsArray(_ arr: [String]) -> String {
    arr.joined()
}

extension ContactInfoView {
    fileprivate func bindingForIndex(_ index: Int) -> Binding<String> {
        Binding<String>(
            get: {
                digitAt(phone, index)
            },
            set: { newVal in
                let cleaned = newVal.filter { $0.isNumber }.prefix(1)
                var arr = toDigitsArray(phone)
                if index >= 0 && index < arr.count {
                    arr[index] = String(cleaned)
                    phone = fromDigitsArray(arr)
                }
            }
        )
    }
}
