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
    @State private var searchText = ""
    @State private var showSearchBar = false // New state to toggle the search bar

    var personalRecords: [Medal] = Medal.personalRecords
    var virtualRaces: [Medal] = Medal.virtualRaces
    @Environment(\.dismiss) var dismiss

    private var filteredPersonalRecords: [Medal] {
        if searchText.isEmpty {
            return personalRecords
        }
        return personalRecords.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }

    private var filteredVirtualRaces: [Medal] {
        if searchText.isEmpty {
            return virtualRaces
        }
        return virtualRaces.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        ZStack {
            VStack {
                // Conditionally show the search bar
                if showSearchBar {
                    SearchBarView(text: $searchText)
                }

                // Medal Sections
                ScrollView {
                    VStack(spacing: 16) {
                        // Personal Records Section
                        SectionView(
                            title: "Personal Records",
                            items: filteredPersonalRecords,
                            completedCount: filteredPersonalRecords.filter { $0.subtitle != "Not Yet" }.count,
                            totalCount: personalRecords.count
                        )

                        // Virtual Races Section
                        SectionView(
                            title: "Virtual Races",
                            items: filteredVirtualRaces,
                            completedCount: filteredVirtualRaces.filter { $0.subtitle != "Not Yet" }.count,
                            totalCount: virtualRaces.count
                        )
                    }
                    .background(Color("WhiteText"))
                }
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
                        showSearchBar: $showSearchBar,
                        personalRecordsCount: personalRecords.count,
                        totalPersonalRecords: personalRecords.count,
                        virtualRacesCount: virtualRaces.count,
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
