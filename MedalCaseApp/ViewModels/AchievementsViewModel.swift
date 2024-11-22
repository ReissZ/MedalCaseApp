//
//  AchievementsViewModel.swift
//  MedalCaseApp
//

import SwiftUI

class AchievementsViewModel: ObservableObject {
    @Published var showSnackBar = false
    @Published var snackBarMessage = ""

    func resetProgress() {
        // Simulate reset logic
        showSnackBar = true
        snackBarMessage = "Progress reset successfully!"

        // Automatically dismiss the snack bar after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showSnackBar = false
            self.snackBarMessage = ""
        }
    }
}
