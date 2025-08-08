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
    var HorizontalFlip: Bool
    var VerticalFlip: Bool

    func body(content: Content) -> some View {
        content
            .scaleEffect(
                x: HorizontalFlip ? -1 : 1,
                y: VerticalFlip ? -1 : 1
            )
            .animation(.easeInOut, value: HorizontalFlip)
            .animation(.easeInOut, value: VerticalFlip)
    }
}

extension View {
    func screenFlip(horizontal: Bool, vertical: Bool) -> some View {
        self.modifier(ScreenFlipModifier(HorizontalFlip: horizontal, VerticalFlip: vertical))
    }
}
