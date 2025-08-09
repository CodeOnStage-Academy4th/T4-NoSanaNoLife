//
//  CouponView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import SwiftUI

struct DiscountItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let amount: Int
    var isApplied: Bool
}

struct CouponView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding var currentPrice: Int

    @State private var basePrice: Int = 18000
    @State private var items: [DiscountItem] = [
        .init(title: "포스텍 학생 할인 30%", amount: 5400, isApplied: true),
        .init(title: "대한민국 국민 할인 20%", amount: 3600, isApplied: true),
        .init(title: "오늘만 반짝 할인", amount: 3980, isApplied: true),
        .init(title: "너만 반짝 할인", amount: 4920, isApplied: true),
    ]

    private var totalDiscount: Int {
        items.filter { $0.isApplied }.map(\.amount).reduce(0, +)
    }
    private var pay: Int { max(basePrice - totalDiscount, 0) }
    private var isPaymentReady: Bool { pay == basePrice }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    Spacer().frame(height: 8)

                    labeledRow(
                        left: "원래 가격",
                        right: won(basePrice),
                        rightStyle: .secondary,
                        strike: true
                    )
                    dividerInset()

                    ForEach($items) { $item in
                        HStack(spacing: 12) {
                            labeledRow(
                                left: item.title,
                                right: won(item.amount)
                            )
                            Button {
                                item.isApplied.toggle()
                            } label: {
                                Image(
                                    systemName: item.isApplied
                                        ? "checkmark.square" : "square"
                                )
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(
                                    item.isApplied ? .green : .gray
                                )
                            }
                            .buttonStyle(.plain)
                        }
                        .frame(minHeight: 56)
                        .padding(.horizontal, 16)

                        dividerInset()
                    }

                    labeledRow(
                        left: "결제 금액",
                        right: won(pay),
                        rightColor: .green,
                        boldRight: true
                    )
                    .padding(.top, 8)

                    Spacer(minLength: 140)
                }
                .background(Color(.systemBackground))
            }
            .onAppear {
                currentPrice = pay
            }
            .onChange(of: items) { _ in
                currentPrice = pay
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .semibold))
                            .tint(.primary)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("할인 쿠폰")
                        .font(.headline)
                }
            }
            .safeAreaInset(edge: .bottom) {
                BottomPayBar(isEnabled: isPaymentReady) {
                    // 결제 액션
                }
            }
        }
    }
    /// 금단의 기술...
    @ViewBuilder
    private func labeledRow(
        left: String,
        right: String,
        rightStyle: Color = .primary,
        rightColor: Color? = nil,
        strike: Bool = false,
        boldRight: Bool = false
    ) -> some View {
        HStack {
            Text(left)
                .font(.body.weight(.semibold))
                .foregroundStyle(.primary)
            Spacer()
            Text(right)
                .font(boldRight ? .headline : .body)
                .foregroundStyle(rightColor ?? rightStyle)
                .strikethrough(strike, color: .secondary)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, minHeight: 56)
    }

    @ViewBuilder
    private func dividerInset() -> some View {
        Divider().padding(.leading, 16)
    }

    private func won(_ value: Int) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "ko_KR")
        return (nf.string(from: NSNumber(value: value)) ?? "\(value)") + "원"
    }
}

private struct BottomPayBar: View {
    var isEnabled: Bool
    var action: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.label))
                .opacity(0.95)
                .frame(width: .infinity, height: 110)

            Button(action: {
                if isEnabled { action() }
            }) {
                Text("결제하기")
                    .font(.headline.weight(.semibold))
                    .frame(maxWidth: .infinity, minHeight: 58)
                    .background(
                        Capsule()
                            .fill(Color(.systemGray4))
                    )
                    .overlay(
                        Capsule()
                            .stroke(Color(.systemGray3), lineWidth: 1)
                    )
                    .foregroundStyle(Color(.systemGray))
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 4)
            .disabled(!isEnabled)
        }
        .background(.clear)
    }
}
