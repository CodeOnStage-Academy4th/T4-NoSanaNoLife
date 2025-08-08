//
//  PaymentMethodView.swift
//  shittket
//
//  Created by yunsly on 8/9/25.
//

import SwiftUI

struct BankLogo: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let colorLogo: String
    let grayLogo: String
}

struct PaymentMethodView: View {
    
    // 은행 데이터
    let logoData: [BankLogo] = [
            BankLogo(name: "기업은행", colorLogo: "giup_color", grayLogo: "giup_gray"),
            BankLogo(name: "신한은행", colorLogo: "shinhan_color", grayLogo: "shinhan_gray"),
            BankLogo(name: "카카오뱅크", colorLogo: "kakao_color", grayLogo: "kakao_gray"),
            BankLogo(name: "하나은행", colorLogo: "hana_color", grayLogo: "hana_gray"),
            BankLogo(name: "제일은행", colorLogo: "jeil_color", grayLogo: "jeil_gray"),
            BankLogo(name: "KB은행", colorLogo: "kb_color", grayLogo: "kb_gray"),
            BankLogo(name: "케이뱅크", colorLogo: "kbank_color", grayLogo: "kbank_gray"),
            BankLogo(name: "농협은행", colorLogo: "nonghub_color", grayLogo: "nonghub_gray"),
            BankLogo(name: "우리은행", colorLogo: "wori_color", grayLogo: "wori_gray"),
            BankLogo(name: "토스뱅크", colorLogo: "toss_color", grayLogo: "toss_gray")
        ]
    
    @State private var buttonTitles: [String]
    @State private var selectedBankName: String?
    @State private var selectedButtonTitle: String?
    
    @Binding var bankMatched: Bool
    

    init(bankMatched: Binding<Bool>) {
        self._bankMatched = bankMatched
        let titles = [
            "케이뱅크", "기업은행", "농협은행", "KB은행", // 정답 이름
            "캌옼뱅크", "기억은행", "토스벵크", "굴비은행", "신난은행", "농혁은행",
            "제옹은행", "카뱅은행", "SC은행", "신핫은행", "무리은행", "토슼뱅크", "케익뱅크",
            "궁민은행", "국민은헹", "은헹벵크"
        ]
        self._buttonTitles = State(initialValue: titles.shuffled())
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var isMatch: Bool {
        guard let bankName = selectedBankName, let buttonTitle = selectedButtonTitle else {
            return false
        }
        return bankName == buttonTitle
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("결제 수단")
                        .font(.headline)
                    Spacer()
                }
                .padding(.vertical)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(logoData) { logo in
                        Button(action: {
                            selectedBankName = logo.name
                        }) {
                            Image(logo.name == selectedBankName ? logo.colorLogo : logo.grayLogo)
                                .resizable().scaledToFit().frame(width: 70, height: 70)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
                        }
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 40)
                
                Divider()
                
                Spacer()
                    .frame(height: 40)
                
                // 은행 선택
                VStack {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(buttonTitles, id: \.self) { title in
                            Button(action: {
                                selectedButtonTitle = title
                            }) {
                                Text(title)
                                    .fontWeight(.semibold)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(title == selectedButtonTitle ? Color.green : Color.gray.opacity(0.6))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                
                .padding(.horizontal, 40)
                
            }
            .onChange(of: isMatch) {
                bankMatched = isMatch
            }
        }
        
    }
}
