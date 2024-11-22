//
//  MedalCaseAppTests.swift
//  MedalCaseAppTests
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import XCTest
@testable import MedalCaseApp

final class MedalCaseAppTests: XCTestCase {
    func testResetProgressUpdatesState() throws {
        // Arrange: Create the ViewModel
        let viewModel = AchievementsViewModel()

        // Act: Trigger the reset progress action
        viewModel.resetProgress()

        // Assert: Verify initial state
        XCTAssertTrue(viewModel.showSnackBar, "Snack bar should be visible after reset progress action.")
        XCTAssertEqual(viewModel.snackBarMessage, "Progress reset successfully!", "The snack bar message should indicate a successful reset.")

        // Simulate delay to verify snack bar auto-dismiss
        let expectation = self.expectation(description: "Snack bar auto-dismiss")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            XCTAssertFalse(viewModel.showSnackBar, "Snack bar should not be visible after 3 seconds.")
            XCTAssertEqual(viewModel.snackBarMessage, "", "Snack bar message should be cleared after 3 seconds.")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 4, handler: nil)
    }
}

