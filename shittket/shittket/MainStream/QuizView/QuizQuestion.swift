//
//  QuizQuestion.swift
//  shittket
//
//  Created by oliver on 8/9/25.
//


import SwiftUI

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int // 정답의 인덱스
}

let questions = [
    QuizQuestion(
        question: "Q1. 페스티벌 명은 무엇인가요?",
        options: ["Code ON Stage", "Code 0n Stage", "Code on Stage"],
        correctAnswer: 2
    ),
    QuizQuestion(
        question: "Q2. 페스티벌은 언제 시작하나요?",
        options: ["8월 7일 오후 7시", "8월 7일 19시", "8월 8일 19시"],
        correctAnswer: 2
    ),
    QuizQuestion(
        question: "Q3. Code on Stage는 몇시간 진행되나요?",
        options: ["20시간", "18시간", "17시간"],
        correctAnswer: 2
    )
]
