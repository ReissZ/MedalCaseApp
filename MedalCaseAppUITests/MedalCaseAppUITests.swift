//
//  MedalCaseAppUITests.swift
//  MedalCaseAppUITests
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import XCTest

final class MedalCaseAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Setup before each test
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Cleanup after each test
    }

    @MainActor
    func testViewAchievementsButtonTapped() throws {
        // Launch the application
        let app = XCUIApplication()
        app.launch()

        // Assert the LandingView is displayed
        XCTAssertTrue(app.staticTexts["Welcome to your ASICS Runkeeper Medal Case"].exists, "The welcome text should be visible on the LandingView.")
        XCTAssertTrue(app.buttons["View Achievements"].exists, "The 'View Achievements' button should be visible.")

        // Tap the "View Achievements" button
        let viewAchievementsButton = app.buttons["View Achievements"]
        viewAchievementsButton.tap()

        // Assert that the AchievementsView is displayed
        XCTAssertTrue(app.navigationBars["Achievements"].exists, "The 'Achievements' navigation bar should be visible after tapping 'View Achievements'.")
    }
}
