//
//  CreateScreenUITests.swift
//  iosTakeHomeProjectUITests
//
//  Created by Khawla Zarrami on 29/01/2026.
//

import XCTest

final class CreateScreenUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
      continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-people-networking-success": "1",
                                 "-create-networking-success": "1",
        
        ]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_valid_form_submission_is_successful() {
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let firstnameTxtField = app.textFields["firstNameTxtField"]
        let lastnameTxtField = app.textFields["lastNameTxtField"]
        let jobTxtField = app.textFields["jobTxtField"]
        
        firstnameTxtField.tap()
        firstnameTxtField.typeText("Khaoula")
        
        lastnameTxtField.tap()
        lastnameTxtField.typeText("Zarrami")
        
        jobTxtField.tap()
        jobTxtField.typeText("iOS developer")
        
        let submitBtn = app.buttons["submitBn"]
        
        XCTAssertTrue(submitBtn.exists, "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        XCTAssertTrue(app.navigationBars["People"].waitForExistence(timeout: 5), "There should be a navigation bar title People")
    }

}
