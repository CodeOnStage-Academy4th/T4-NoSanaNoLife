//
//  File.swift
//  shittket
//
//  Created by oliver on 8/9/25.
//

import SwiftUICore

extension Font {
    enum WantedSansWeight {
        case bold
        case extraBlack
        case extraBold
        case semiBold
        case medium
        case black
        case regular
        
        var value: String {
            switch self {
            case .bold: "Bold"
            case .extraBlack: "ExtraBlack"
            case .extraBold: "ExtraBold"
            case .semiBold: "SemiBold"
            case .medium: "Medium"
            case .black: "Black"
            case .regular: "Regular"
            }
        }
    }
    
    static func wantedSans(_ weight: WantedSansWeight, size fontSize: CGFloat) -> Font {
        let familyName = "WantedSans"
        let weightName = weight.value
        return Font.custom("\(familyName)-\(weightName)", size: fontSize)
    }
}
