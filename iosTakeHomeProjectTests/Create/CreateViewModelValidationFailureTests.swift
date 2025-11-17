//
//  CreateViewModelFailureTests.swift
//  iosTakeHomeProjectTests
//
//  Created by Khawla Zarrami on 17/11/2025.
//

import XCTest
@testable import iosTakeHomeProject

final class CreateViewModelValidationFailureTests: XCTestCase {
    private var networkingMock: NetworkingManagerImpl!
    private var validationMock: CreateValidatorImpl!
    private var vm: CreateViewModel!
    
    
    override  func setUp() {
        networkingMock = NetworkingManagerCreateSuccessMock()
        validationMock = CreateValidatorFailureMock()
        vm = CreateViewModel(networkingManager: networkingMock, validator: validationMock)
    }
    
    override func tearDown() {
        networkingMock = nil
        validationMock = nil
        vm = nil
    }
    
    func test_with_invalid_form_submission_state_is_invalid() async {
        XCTAssertNil(vm.state, "The view model should be nil initially")
        defer {
            XCTAssertEqual(vm.state, .unsuccessful, "The view model state should be unsuccessful")
            
            
        }
        await vm.create()
        
        XCTAssertTrue(vm.hasError, "The view model should have an error")
        XCTAssertNotNil(vm.error, "The view model property should'nt be nil")
        XCTAssertEqual(vm.error, .validation(error: CreateValidator.createValidatorError.invalidFirstName), "The view model error should be invalid first name")
    }

}
