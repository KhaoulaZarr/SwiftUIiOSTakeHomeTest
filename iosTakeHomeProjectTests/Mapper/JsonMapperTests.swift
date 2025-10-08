//
//  JsonMapperTests.swift
//  iosTakeHomeProjectTests
//
//  Created by Khawla Zarrami on 08/10/2025.
//

import Foundation
import XCTest
@testable import iosTakeHomeProject

class JsonMapperTests: XCTestCase {
    
    
    func test_with_valid_json_successfully_decodes() {
        XCTAssertNoThrow( try StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper shouldn't throw an error")
        let userResponse = try? StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        XCTAssertNotNil(userResponse, "User response should'nt be nil")
        XCTAssertEqual(userResponse?.page, 1, "Page number should be 1")
        XCTAssertEqual(userResponse?.perPage, 6, "Page number should be 6")
        XCTAssertEqual(userResponse?.totalPages, 2, "Total pages shouls be 2")
        XCTAssertEqual(userResponse?.data.count, 6, "The total number of users should be 6")
        XCTAssertEqual(userResponse?.data[0].id, 1, "the id should be 1")
        XCTAssertEqual(userResponse?.data[0].email, "george.bluth@reqres.in", "the email should be george.bluth@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "George", "the first name should be George")
        XCTAssertEqual(userResponse?.data[0].lastName, "Bluth", "the last name should be Bluth")
        XCTAssertEqual(userResponse?.data[0].avatar, "https://reqres.in/img/faces/1-image.jpg", "the url should be https://reqres.in/img/faces/1-image.jpg")
        
        
        
        XCTAssertEqual(userResponse?.data[1].id, 2, "the id should be 2")
        XCTAssertEqual(userResponse?.data[1].email, "janet.weaver@reqres.in", "the email should be janet.weaver@reqres.in")
        XCTAssertEqual(userResponse?.data[1].firstName, "Janet", "the first name should be Janet")
        XCTAssertEqual(userResponse?.data[1].lastName, "Weaver", "the last name should be Weaver")
        XCTAssertEqual(userResponse?.data[1].avatar, "https://reqres.in/img/faces/2-image.jpg", "the url should be https://reqres.in/img/faces/2-image.jpg")
        
        XCTAssertEqual(userResponse?.data[2].id, 3, "the id should be 3")
        XCTAssertEqual(userResponse?.data[2].email, "emma.wong@reqres.in", "the email should be emma.wong@reqres.in")
        XCTAssertEqual(userResponse?.data[2].firstName, "Emma", "the first name should be Emma")
        XCTAssertEqual(userResponse?.data[2].lastName, "Wong", "the last name should be Wong")
        XCTAssertEqual(userResponse?.data[2].avatar, "https://reqres.in/img/faces/3-image.jpg", "the url should be https://reqres.in/img/faces/3-image.jpg")
        
        XCTAssertEqual(userResponse?.data[3].id, 4, "the id should be 4")
        XCTAssertEqual(userResponse?.data[3].email, "eve.holt@reqres.in", "the email should be eve.holt@reqres.in")
        XCTAssertEqual(userResponse?.data[3].firstName, "Eve", "the first name should be Eve")
        XCTAssertEqual(userResponse?.data[3].lastName, "Holt", "the last name should be Holt")
        XCTAssertEqual(userResponse?.data[3].avatar, "https://reqres.in/img/faces/4-image.jpg", "the url should be https://reqres.in/img/faces/4-image.jpg")
        
        XCTAssertEqual(userResponse?.data[4].id, 5, "the id should be 5")
        XCTAssertEqual(userResponse?.data[4].email, "charles.morris@reqres.in", "the email should be charles.morris@reqres.in")
        XCTAssertEqual(userResponse?.data[4].firstName, "Charles", "the first name should be Charles")
        XCTAssertEqual(userResponse?.data[4].lastName, "Morris", "the last name should be Morris")
        XCTAssertEqual(userResponse?.data[4].avatar, "https://reqres.in/img/faces/5-image.jpg", "the url should be https://reqres.in/img/faces/5-image.jpg")
        
        
        XCTAssertEqual(userResponse?.data[5].id, 6, "the id should be 6")
        XCTAssertEqual(userResponse?.data[5].email, "tracey.ramos@reqres.in", "the email should be tracey.ramos@reqres.in")
        XCTAssertEqual(userResponse?.data[5].firstName, "Tracey", "the first name should be Tracey")
        XCTAssertEqual(userResponse?.data[5].lastName, "Ramos", "the last name should be Ramos")
        XCTAssertEqual(userResponse?.data[5].avatar, "https://reqres.in/img/faces/6-image.jpg", "the url should be https://reqres.in/img/faces/6-image.jpg")
        
    }
    
    func test_with_missing_file_thrown() {
        
        XCTAssertThrowsError(try StaticJsonMapper.decode(file: "", type: UsersResponse.self), "An error should be thrown")
        
        do {
            _ = try StaticJsonMapper.decode(file: "", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJsonMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJsonMapper.MappingError.failedToGetContents, "This should be failed to get content error")
            
        }
    }
    
    func test_with_invalid_file_thrown() {
        
        XCTAssertThrowsError(try StaticJsonMapper.decode(file: "dfddfff", type: UsersResponse.self), "An error should be thrown")
        
        do {
            _ = try StaticJsonMapper.decode(file: "dfdfffd", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJsonMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJsonMapper.MappingError.failedToGetContents, "This should be failed to get content error")
            
        }
    }
    
    func test_with_invalid_json_error_thrown() {
        XCTAssertThrowsError(try StaticJsonMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self), "An error should be thrown")
        do {
            _ = try StaticJsonMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self)
        } catch {
            if error is StaticJsonMapper.MappingError {
                XCTFail("Got the wrong type of error, expecting a system decoding error")
            }
        }
    }
}
