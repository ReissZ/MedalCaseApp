//
//  LandingView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct LandingView: View {
    init() {
        // Custom nav bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "PrimaryBlue")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Spacer()

                // Welcome Text
                VStack(spacing: 8) {
                    Text("Welcome to your ASICS Runkeeper Medal Case")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color("BlackText"))

                    Text("Track your achievements and progress")
                        .font(.system(size: 16))
                        .foregroundColor(Color("LightGrayText"))
                }
                .padding(.horizontal)

                Spacer()

                // Navigate to AchievementsView
                NavigationLink(destination: AchievementsView()) {
                    Text("View Achievements")
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("PrimaryBlue"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()

                // Footer Text
                Text("App developed by: Reiss Zurbyk")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(Color("DarkGrayText"))
                    .padding(.bottom, 16)
            }
            .padding()
            .navigationTitle("Medal Case")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LandingView()
}
