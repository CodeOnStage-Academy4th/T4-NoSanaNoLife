//
//  File.swift
//  shittket
//
//  Created by oliver on 8/9/25.
//

import DeveloperToolsSupport

struct FestivalCard: Identifiable {
    let imageReSource: ImageResource
    let name: String
    let dateInfo: String
    let isAvailable: Bool
    var id: String { self.name }
}

let festivalCards = [
    FestivalCard(imageReSource: .poster1, name: "Earth Rock\nExtravaganza", dateInfo: "07.26-28.2077", isAvailable: true),
    FestivalCard(imageReSource: .poster2, name: "Earth Rock 2\nKorea", dateInfo: "07.26-28.2177", isAvailable: false),
    FestivalCard(imageReSource: .poster3, name: "Rock Festival", dateInfo: "Aug.18-20.2018", isAvailable: false),
    FestivalCard(imageReSource: .poster4, name: "INCHEON PENTAPORT", dateInfo: "Aug.9-11.2019", isAvailable: false),
    FestivalCard(imageReSource: .poster5, name: "2025 BUSAN\nInternational\nRock Festival", dateInfo: "09.26-28.2025", isAvailable: false),
    FestivalCard(imageReSource: .poster6, name: "Let’s Rock", dateInfo: "Jun.20-21.1990", isAvailable: false),
    FestivalCard(imageReSource: .poster7, name: "Code on Stage", dateInfo: "8.8-9.2025", isAvailable: false),
]
