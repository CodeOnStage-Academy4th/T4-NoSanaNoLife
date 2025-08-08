import SwiftUI

struct QuizView: View {
    @State private var selectedAnswers: [Int?] = [nil, nil, nil]
    @State private var showAlert = false
    
    var allQuestionsAnswered: Bool {
        selectedAnswers.allSatisfy { $0 != nil }
    }
    
    var allAnswersCorrect: Bool {
        for (index, selectedIndex) in selectedAnswers.enumerated() {
            guard let selectedIndex = selectedIndex else { return false }
            if selectedIndex != questions[index].correctAnswer {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(questions.indices, id: \.self) { questionIndex in
                VStack(alignment: .leading, spacing: 10) {
                    Text(questions[questionIndex].question)
                        .font(.wantedSans(.medium, size: 24))
                    
                    ForEach(questions[questionIndex].options.indices, id: \.self) { optionIndex in
                        Button {
                            selectAnswer(questionIndex: questionIndex, optionIndex: optionIndex)
                        } label: {
                            HStack {
                                Label {
                                    Text(questions[questionIndex].options[optionIndex])
                                } icon: {
                                    Image(systemName: iconName(questionIndex: questionIndex, optionIndex: optionIndex))
                                }
                                Spacer()
                            }
                            .foregroundStyle(.black)
                        }
                        .background(backgroundColor(questionIndex: questionIndex, optionIndex: optionIndex))
                        .cornerRadius(4)
                    }
                }
                .padding(10)
            }
            .padding(9)
            
            Spacer()
            
            VStack(spacing: 12) {
                Text("이전")
                    .font(.wantedSans(.medium, size: 17))
                    .frame(height: 30)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 9)
                    .background(Color(red: 0.52, green: 0.92, blue: 0.49))
                    .cornerRadius(24)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .padding(.horizontal, 19)
                    .background(Color(red: 0.86, green: 0.86, blue: 0.85))
                
                Button("진짜 예매하기") {
                    if allAnswersCorrect {
                        // 다음 화면으로 이동하는 로직
                        print("모든 정답 완료!")
                    } else {
                        showAlert = true
                    }
                }
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
        .alert("제대로 읽고 오셨나요?", isPresented: $showAlert) {
            Button("네. 다시 풀어보겠습니다.") {
            }
        } message: {
            Text("정보를 잘 보는 것이 중요합니다.")
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func selectAnswer(questionIndex: Int, optionIndex: Int) {
        selectedAnswers[questionIndex] = optionIndex
    }
    
    private func iconName(questionIndex: Int, optionIndex: Int) -> String {
        if selectedAnswers[questionIndex] == optionIndex {
            return "dot.scope"
        } else {
            return "scope"
        }
    }
    
    private func textColor(questionIndex: Int, optionIndex: Int) -> Color {
        if selectedAnswers[questionIndex] == optionIndex {
            return questions[questionIndex].correctAnswer == optionIndex ? .green : .red
        } else {
            return .primary
        }
    }
    
    private func backgroundColor(questionIndex: Int, optionIndex: Int) -> Color {
        if selectedAnswers[questionIndex] == optionIndex {
            return .gray.opacity(0.2)
        } else {
            return Color.clear
        }
    }
    
    private var buttonBackgroundColor: Color {
        if allQuestionsAnswered {
            return .blue
        } else {
            return .gray
        }
    }
}

#Preview {
    QuizView()
}
