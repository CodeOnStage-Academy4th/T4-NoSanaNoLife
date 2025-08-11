//
//  EventManager.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

class EventManager: ObservableObject {
    @Published var HorizontalFlip: Bool = false
    @Published var VerticalFlip: Bool = false

    func triggerScreenFlip() {
        if Bool.random() {
            HorizontalFlip.toggle()
        }
        if Bool.random() {
            VerticalFlip.toggle()
        }
    }
}
