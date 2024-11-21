//
//  DevelopmentUITests.swift
//  DevelopmentUITests
//
//  Created by Shin Unuma on 2024/11/19.
//

import XCTest

final class DevelopmentUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["A New Hope"]
        button.tap()
    }

}
