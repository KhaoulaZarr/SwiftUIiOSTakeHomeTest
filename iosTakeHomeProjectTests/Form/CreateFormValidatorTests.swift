//
//  CreateFormValidatorTests.swift
//  iosTakeHomeProjectTests
//
//  Created by Khawla Zarrami on 11/10/2025.
//

import XCTest
@testable import iosTakeHomeProject

final class CreateFormValidatorTests: XCTestCase {
    
    private var validator: CreateValidator!
    
    override func setUp() {
        validator = CreateValidator()
    }
    
    override func tearDown() {
        validator = nil
    }

    func test_with_empty_person_first_name_error_thrown() {
        let person = NewPerson()
        XCTAssertThrowsError( try validator.validate(person), "Error for an empty first name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validatorError = error as? CreateValidator.createValidatorError else {
                XCTFail("Got the wrong type of error expecting a CreateValidator.createValidatorError")
                return
            }
            XCTAssertEqual(validatorError, CreateValidator.createValidatorError.invalidFirstName, "Expecting an error where we have an invalid first name")
            
        }
    }
    
    func test_with_empty_first_name_error_thrown() {
        let person = NewPerson(lastName: "Ads", job: "iOS Dev")
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty first name should be thrown")
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validatorError = error as? CreateValidator.createValidatorError else {
                XCTFail("Got the wrong type of error expecting a CreateValidator.createValidatorError")
                return
            }
            XCTAssertEqual(validatorError, CreateValidator.createValidatorError.invalidFirstName ,"Expecting an error where we have an invalid first  name")
        }
        
    }
    
    func test_with_empty_last_name_error_thrown() {
        let person = NewPerson(firstName: "Tuns", job: "iOS Dev")
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty last name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validatorError = error as? CreateValidator.createValidatorError else {
                XCTFail("Got the wrong type of error expecting a CreateValidator.createValidatorError")
                return
            }
            XCTAssertEqual(validatorError, CreateValidator.createValidatorError.invalidLastName,"Expecting an error where we have an invalid  last name")
        }
    }
    
    func test_with_empty_job_error_thrown() {
        let person = NewPerson(firstName: "Tuns", lastName: "Ads")
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty job should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validatorError = error as? CreateValidator.createValidatorError else {
                XCTFail("Got the wrong type of error expecting a CreateValidator.createValidatorError")
                return
            }
            XCTAssertEqual(validatorError, CreateValidator.createValidatorError.invalidJob,"Expecting an error where we have an invalid job")
        }
    }
    
    func test_with_valid_person_error_not_thrown() {
        let person = NewPerson(firstName: "Tuns", lastName: "Ads", job: "iOS Dev")
        
        do {
            _ = try validator.validate(person)
        }catch {
            XCTFail("No errors should be thrown, since the person should be a valid object")
        }
    }

}
