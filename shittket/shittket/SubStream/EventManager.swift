//
//  EventManager.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

class AppEventManager: ObservableObject {
    @Published var isScreenFlipped: Bool = false
    @Published var flipDirection: FlipDirection = .horizontal

    func triggerScreenFlip() {
        isScreenFlipped.toggle()
        flipDirection = Bool.random() ? .horizontal : .vertical
    }
}
