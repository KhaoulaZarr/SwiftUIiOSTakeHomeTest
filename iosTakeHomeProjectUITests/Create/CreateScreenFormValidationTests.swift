//
//  CreateScreenFormValidationTests.swift
//  iosTakeHomeProjectUITests
//
//  Created by Khawla Zarrami on 29/01/2026.
//

import XCTest

final class CreateScreenFormValidationTests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
      continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-people-networking-success": "1"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_all_form_fields_is_empty_first_name_error_is_shown() {
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let submitBtn = app.buttons["submitBn"]
        
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        
        XCTAssertTrue(alert.staticTexts["First name can't be empty"].exists)
        
        XCTAssertEqual(alertBtn.label, "OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["First name can't be empty"].exists)
        
        XCTAssertEqual(app.alerts.count, 0, "There should be no alert on the screen")
    }
    
    func test_when_first_name_form_field_is_empty_first_name_error_is_shown() {
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let lastnameTxtField = app.textFields["lastNameTxtField"]
        let jobTxtField = app.textFields["jobTxtField"]
        lastnameTxtField.tap()
        lastnameTxtField.typeText("Zarrami")
        
        jobTxtField.tap()
        jobTxtField.typeText("iOS developer")
        
        let submitBtn = app.buttons["submitBn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["First name can't be empty"].exists)
        
        XCTAssertEqual(alertBtn.label, "OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["First name can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0 , "There should be no alert on the screen")
        
        
    }
    
    
    func test_when_last_name_form_field_is_empty_last_name_error_is_shown() {
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let firstnameTxtField = app.textFields["firstNameTxtField"]
        let jobTxtField = app.textFields["jobTxtField"]
        firstnameTxtField.tap()
        firstnameTxtField.typeText("Khaoula")
        
        jobTxtField.tap()
        jobTxtField.typeText("iOS developer")
        
        let submitBtn = app.buttons["submitBn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["Last name can't be empty"].exists)
        
        XCTAssertEqual(alertBtn.label, "OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["Last name can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0 , "There should be no alert on the screen")
    }
    
    
    func test_when_job_form_field_is_empty_job_error_is_shown() {
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let firstnameTxtField = app.textFields["firstNameTxtField"]
        let lastnameTxtField = app.textFields["lastNameTxtField"]
        firstnameTxtField.tap()
        firstnameTxtField.typeText("Khaoula")
        
        lastnameTxtField.tap()
        lastnameTxtField.typeText("Zarrami")
        
        let submitBtn = app.buttons["submitBn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["Job can't be empty"].exists)
        
        XCTAssertEqual(alertBtn.label, "OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["Job can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0 , "There should be no alert on the screen")
    }

}
