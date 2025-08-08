//
//  NameInfoView.swift
//  shittket
//
//  Created by yunsly on 8/9/25.
//

import SwiftUI

struct NameInfoView: View {
    
    let characters: [String] = ["올", "디", "들", "마", "버", "사", "가", "이", "산", "리", "하", "나"]
    let targetNames: Set<String> = ["하이디", "올리버", "하마", "사나", "산들"]
    
    // 사용자가 선택한 문자들을 순서대로 저장
    @State private var selectedCharacters: [String] = []
    
    // 조합된 이름이 targetNames 배열에 포함되는지
    @Binding var isNameCompleted: Bool
    
    // selectedCharacters 배열을 합쳐 조합된 이름을 반환
    private var combinedName: String {
        selectedCharacters.joined()
    }
    
    var body: some View {
        HStack {
            Text("이름")
                .fontWeight(.bold)
            Spacer()
            HStack(spacing: 3) {
                ForEach(characters, id: \.self) { char in
                    let isSelected = selectedCharacters.contains(char)
                    Button(action: {
                        if let index = selectedCharacters.firstIndex(of: char) {
                            selectedCharacters.remove(at: index)
                        } else {
                            selectedCharacters.append(char)
                        }
                    }) {
                        Text(char)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(isSelected ? .white : .green)
                            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                            .background(isSelected ? .green : .white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(Color.green, lineWidth: 1)
                            )
                            .animation(.snappy, value: isSelected)
                            .padding(0.5)
                    }
                    
                }
            }
            
        }
        .onChange(of: selectedCharacters) {
            isNameCompleted = targetNames.contains(combinedName)
        }
//        .padding(.horizontal)
        


    }
}

