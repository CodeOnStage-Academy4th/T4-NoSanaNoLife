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
    var id: String { self.name }
}

let festivalCards = [
    FestivalCard(imageReSource: .poster1, name: "Earth Rock\nExtravaganza", dateInfo: "07.26-28.2077"),
    FestivalCard(imageReSource: .poster2, name: "Earth Rock 2\nKorea", dateInfo: "07.26-28.2177"),
    FestivalCard(imageReSource: .poster3, name: "Rock Festival", dateInfo: "Aug.18-20.2018"),
    FestivalCard(imageReSource: .poster4, name: "INCHEON PENTAPORT", dateInfo: "Aug.9-11.2019"),
    FestivalCard(imageReSource: .poster5, name: "2025 BUSAN\nInternational\nRock Festival", dateInfo: "09.26-28.2025"),
    FestivalCard(imageReSource: .poster6, name: "Let’s Rock", dateInfo: "Jun.20-21.1990"),
    FestivalCard(imageReSource: .poster7, name: "Code on Stage", dateInfo: "8.8-9.2025"),
]
