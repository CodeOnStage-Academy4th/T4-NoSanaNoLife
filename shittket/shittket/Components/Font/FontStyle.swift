//
//  FontStyle.swift
//  shittket
//
//  Created by POS on 8/9/25.
//

import Foundation
import SwiftUI

extension Font {
    enum WantedSans {
        case regular
        case medium
        case semibold
        case bold

        var name: String {
            switch self {
            case .regular: return "WantedSans-Regular"
            case .medium: return "WantedSans-Medium"
            case .semibold: return "WantedSans-SemiBold"
            case .bold: return "WantedSans-Bold"
            }
        }
    }

    static func wanted(_ type: WantedSans, size: CGFloat) -> Font {
        .custom(type.name, size: size)
    }
    
    static var wantedSemi32: Font { .wanted(.semibold, size: 32) }
    static var wantedSemi20: Font { .wanted(.semibold, size: 20) }
    static var wantedSemi17: Font { .wanted(.semibold, size: 17) }
    static var wantedSemi10: Font { .wanted(.semibold, size: 10) }
    
    static var wantedReg48: Font { .wanted(.regular, size: 48) }
    static var wantedReg17: Font { .wanted(.regular, size: 17) }
    static var wantedReg10: Font { .wanted(.regular, size: 10) }
    
    static var wantedMed48: Font { .wanted(.medium, size: 48) }
    static var wantedMed24: Font { .wanted(.medium, size: 24) }
    static var wantedMed17: Font { .wanted(.medium, size: 17) }
    static var wantedMed10: Font { .wanted(.medium, size: 10) }
}
