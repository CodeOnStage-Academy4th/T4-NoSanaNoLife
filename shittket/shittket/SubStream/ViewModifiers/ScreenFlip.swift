//
//  ScreenFlip.swift
//  shittket
//
//  Created by POS on 8/9/25.
//  화면을 좌우 또는 상하로 반전함

import Foundation
import SwiftUI

enum FlipDirection {
    case horizontal
    case vertical
}

struct ScreenFlipModifier: ViewModifier {
    var isActive: Bool
    var direction: FlipDirection

    func body(content: Content) -> some View {
        content
            .scaleEffect(
                x: isActive && direction == .horizontal ? -1 : 1,
                y: isActive && direction == .vertical ? -1 : 1
            )
            .animation(.easeInOut, value: isActive)
    }
}
