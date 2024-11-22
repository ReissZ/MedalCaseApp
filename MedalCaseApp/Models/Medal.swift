//
//  Medal.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct Medal: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String

    static let personalRecords: [Medal] = [
        Medal(imageName: "fastest_5k", title: "Fastest 5K", subtitle: "00:00"),
        Medal(imageName: "fastest_10k", title: "Fastest 10K", subtitle: "00:00:00"),
        Medal(imageName: "longest_run", title: "Longest Run", subtitle: "00:00"),
        Medal(imageName: "highest_elevation", title: "Highest Elevation", subtitle: "2095 ft"),
        Medal(imageName: "fastest_half_marathon", title: "Half Marathon", subtitle: "00:00"),
        Medal(imageName: "fastest_marathon", title: "Marathon", subtitle: "Not Yet")
    ]

    static let virtualRaces: [Medal] = [
        Medal(imageName: "virtual_10k_race", title: "Virtual 10K Race", subtitle: "00:00:00"),
        Medal(imageName: "virtual_5k_race", title: "Virtual 5K Race", subtitle: "23:07"),
        Medal(imageName: "tokyo_hakone_ekiden_2020", title: "Tokyo-Hakone Ekiden", subtitle: "00:00:00"),
        Medal(imageName: "hakone_ekiden", title: "Hakone Ekiden", subtitle: "00:00:00"),
        Medal(imageName: "mizuno_singapore_ekiden", title: "Mizuno Singapore Ekiden 2015", subtitle: "00:00"),
        Medal(imageName: "virtual_half_marathon_race", title: "Virtual Half Marathon", subtitle: "00:00"),
        Medal(imageName: "virtual_marathon_race", title: "Virtual Marathon", subtitle: "00:00")

    ]
}
