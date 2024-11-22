//
//  EllipsisMenuView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct EllipsisMenuView: View {
    @Binding var showResetConfirmation: Bool
    @Binding var showAboutDeveloper: Bool

    let personalRecordsCount: Int
    let totalPersonalRecords: Int
    let virtualRacesCount: Int
    let totalVirtualRaces: Int

    var body: some View {
        Menu {
            // Share Achievements Option
            Button(action: {
                shareAchievements()
            }) {
                Label("Share Achievements", systemImage: "square.and.arrow.up")
            }

            // Reset Progress Option
            Button(role: .destructive, action: {
                showResetConfirmation = true
            }) {
                Label("Reset Progress", systemImage: "arrow.clockwise")
            }

            // About the Developer Option
            Button(action: {
                showAboutDeveloper = true
            }) {
                Label("About the Developer", systemImage: "person.circle")
            }
        } label: {
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
                .foregroundColor(.white)
        }
    }

    private func shareAchievements() {
        let achievementsSummary = """
        I've completed \(personalRecordsCount) out of \(totalPersonalRecords) Personal Records!
        I've also completed \(virtualRacesCount) out of \(totalVirtualRaces) Virtual Races!

        Join me and track your progress in the ASICS Medal Case App!
        """

        let activityController = UIActivityViewController(activityItems: [achievementsSummary], applicationActivities: nil)

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityController, animated: true, completion: nil)
        }
    }

    func resetProgress() {
        print("Progress reset successfully!")
    }
}

#Preview {
    EllipsisMenuView(
        showResetConfirmation: .constant(false),
        showAboutDeveloper: .constant(false),
        personalRecordsCount: 5,
        totalPersonalRecords: 6,
        virtualRacesCount: 3,
        totalVirtualRaces: 7
    )
}


