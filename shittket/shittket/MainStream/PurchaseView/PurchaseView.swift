//
//  PurchaseView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  결제창

import SwiftUI

struct PurchaseView: View {
    // 주문자 정보
    @State private var isNameCompleted: Bool = false
    @State private var isContactcompleted: Bool = true

    // 결제 정보
    @State private var finalPrice: Int = 100
    @State private var isPriceCompleted: Bool = false
    @State private var bankMatched = false

    // 결제 버튼 활성화 조건
    var isPaymentReady: Bool {
        isNameCompleted && isContactcompleted && isPriceCompleted
    }

    @State private var toResult = false
    @State private var toCoupon = false

    // 알림창
    @State private var showKingAlert: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // MARK: - 주문자 확인
                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: 20)

                        HStack {
                            Text("주문자 확인 및 예매 정보 및 결제 정보 및 결제 방식")
                                .font(.headline)
                            Spacer()
                        }
                        Divider()

                        // 이름
                        NameInfoView(isNameCompleted: $isNameCompleted)
                            .padding(.vertical)
                        Divider()

                        // 전화번호
                        ContactInfoView(isContactcompleted: $isContactcompleted)
                            .padding(.vertical)
                        Divider()

                        // 농락요소1
                        HStack {
                            Button(action: {
                                showKingAlert = true
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            .alert(isPresented: $showKingAlert) {
                                Alert(
                                    title: Text("저희는 전화번호가 필요하지 않습니다."),
                                    message: Text("혹시나 적으셨다면 죄송합니다."),
                                    dismissButton: .default(Text("네. 괜찮습니다."))
                                )
                            }
                            Spacer()
                            HStack {
                                Text("*")
                                    .foregroundColor(.red)

                                Text(
                                    "이 앱은 CRUD가 없기 때문에, 당신의 하나 뿐인 정보가 저장되지 않음을 알려드립니다."
                                )
                                .frame(width: 250)
                            }
                        }
                        .padding(.vertical)
                        Divider()

                        // 주문 상품
                        HStack {
                            Text("주문 상품")
                                .font(.headline)
                            Spacer()
                            VStack {
                                Text("Code on Stage")
                                    .padding(.top)
                                    .fontWeight(.bold)
                                Image("loading-img")
                            }
                        }
                        Divider()

                        // 가격
                        InfoRowView(
                            label: "원래 가격",
                            value: "18000원",
                            isStrikethrough: true
                        )
                        InfoRowView(
                            label: "할인 쿠폰",
                            value: "18000원 - \(18000 - finalPrice)원"
                        )

                        HStack {
                            Spacer()
                            Button(action: {
                                // 쿠폰 어케 할거임
                                toCoupon = true
                            }) {
                                HStack(spacing: 3) {
                                    Text("할인 쿠폰 적용")
                                    Image(systemName: "icloud.and.arrow.down")
                                }
                            }
                            .font(.caption)
                            .padding(.horizontal, 10)  // 좌우 내부 여백
                            .padding(.vertical, 8)  // 상하 내부 여백
                            .foregroundColor(.black)
                            .background(.green)
                            .clipShape(Capsule())

                            NavigationLink(
                                "",
                                destination: CouponView(currentPrice: $finalPrice),
                                isActive: $toCoupon
                            )
                            .hidden()
                        }

                        InfoRowView(
                            label: "결제 금액",
                            value: "\(finalPrice)원",
                            valueColor: .green
                        )

                        HStack {
                            Spacer()
                            Text("최소 결제 금액은 18,000원 입니다.")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical)
                        Divider()

                        // 결제 수단
                        PaymentMethodView(bankMatched: $bankMatched)
                        //                        PaymentMethodView()

                    }
                    .padding(.horizontal)

                }

                // MARK: - 결제하기 버튼
                Button(action: {
                    if isPaymentReady {
                        toResult = true
                    }
                }) {

                    Text("결제하기")
                        .font(.headline.bold())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isPaymentReady ? Color.green : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .background(.black)
                .disabled(!isPaymentReady)
                .animation(.easeInOut, value: isPaymentReady)

                NavigationLink(
                    "",
                    destination: PurchaseReultView(),
                    isActive: $toResult
                )
                .hidden()

            }
            .navigationTitle("결제 창")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: finalPrice) {
                if finalPrice > 10000 {
                    isPriceCompleted = true
                }
            }
        }
    }
}

#Preview {
    PurchaseView()
}
