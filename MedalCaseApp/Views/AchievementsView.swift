//
//  AchievementsView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct AchievementsView: View {
    @StateObject private var viewModel = AchievementsViewModel()
    @State private var showResetConfirmation = false
    @State private var showAboutDeveloper = false

    var personalRecords: [Medal] = Medal.personalRecords
    var virtualRaces: [Medal] = Medal.virtualRaces
    @Environment(\.dismiss) var dismiss

    private var completedPersonalRecords: Int {
        personalRecords.filter { $0.subtitle != "Not Yet" }.count
    }

    private var completedVirtualRaces: Int {
        virtualRaces.filter { $0.subtitle != "Not Yet" }.count
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Personal Records Section with Counter
                    SectionView(
                        title: "Personal Records",
                        items: personalRecords,
                        completedCount: completedPersonalRecords,
                        totalCount: personalRecords.count
                    )

                    // Virtual Races Section
                    SectionView(title: "Virtual Races", items: virtualRaces)
                }
                .background(Color("WhiteText"))
            }
            .navigationTitle("Achievements")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EllipsisMenuView(
                        showResetConfirmation: $showResetConfirmation,
                        showAboutDeveloper: $showAboutDeveloper,
                        personalRecordsCount: completedPersonalRecords,
                        totalPersonalRecords: personalRecords.count,
                        virtualRacesCount: completedVirtualRaces,
                        totalVirtualRaces: virtualRaces.count
                    )
                }
            }
            .navigationBarBackButtonHidden(true)

            // Snack bar overlay
            if viewModel.showSnackBar {
                VStack {
                    Spacer()
                    SnackBarView(message: viewModel.snackBarMessage)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(.easeInOut, value: viewModel.showSnackBar)
                }
            }
        }
        .sheet(isPresented: $showAboutDeveloper) {
            AboutDeveloperView()
        }
    }
}

#Preview {
    NavigationView {
        AchievementsView()
    }
}
