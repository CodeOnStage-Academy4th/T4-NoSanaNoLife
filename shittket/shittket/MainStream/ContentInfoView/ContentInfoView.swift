//
//  ContentInfoView.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  공연정보뷰

import SwiftUI

struct ContentInfoView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Image(.codeOnStage)
                    .navigationBarTitleDisplayMode(.inline)
                
                VStack {
                    Text("이번 여름, 러너들을 위한 스테이지가 열립니다!\n처음 만난 사람들과 팀을 이루고 서로의 색깔을 조율해 나가는, 모두가 주인공이 되는 “Code on Stage”! 보컬, 기타리스트, 키보드, 드러머, 각자의 포지션에서 자유롭게 연주하듯 우리만의 창작물을 만들어 내봐요")
                        .font(.wantedSans(.medium, size: 48))
                    Text("🕑 8월 7일(목) 오후 7시 ~ 오후 9시 30분 8월 8일(금) 오후 7시 ~ 8월 9일(토) 오후 12시")
                        .font(.wantedSans(.medium, size: 10))
                    Text("아이디어, 기획, 디자인, 개발이 밴드처럼 하나로 합쳐지는 단 하루의 스테이지 새로운 연결과 영감이 넘치는 무대 위에서, 여러분의 빛나는 코드를 들려주세요 🎤")
                        .font(.wantedSans(.medium, size: 48))
                }
                .padding(10)
                .padding(.horizontal, 9)
                
                VStack(spacing: 12) {
                    HStack(spacing: 10) {
                        Text("단독판매")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.clear)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(.white, lineWidth: 1)
                            )
                        Text("즉시배송")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.clear)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(.white, lineWidth: 1)
                            )
                        NavigationLink("예매하기") {
                            
                        }
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.clear)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 0.5)
                                .stroke(.white, lineWidth: 1)
                        )
                        Spacer()
                    }
                    
                    Text("코드온 스테이지")
                        .font(.wantedSans(.semiBold, size: 17))
                        .foregroundStyle(.white)
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .padding(.horizontal, 19)
                    .background(Color(red: 0.86, green: 0.86, blue: 0.85))
                    
                    Text("포항 포스텍 C5, 5층")
                        .font(.wantedSans(.semiBold, size: 17))
                        .foregroundStyle(.white)
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .padding(.horizontal, 19)
                    .background(Color(red: 0.86, green: 0.86, blue: 0.85))
                    
                    Text("굿즈증정")
                        .font(.wantedSans(.medium, size: 17))
                        .frame(height: 30)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 9)
                        .background(Color(red: 0.52, green: 0.92, blue: 0.49))
                        .cornerRadius(24)
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .padding(.bottom, 26.5)
                .background(Color(red: 0.16, green: 0.16, blue: 0.16))
                .cornerRadius(12)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Code on Stage")
                    .font(.wantedSans(.semiBold, size: 20))
            }
        }
    }
    
}


#Preview {
    ContentInfoView()
}
