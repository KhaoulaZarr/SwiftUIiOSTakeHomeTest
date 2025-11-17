//
//  CreateValidatorFailureMock.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 17/11/2025.
//
 import Foundation
@testable import iosTakeHomeProject

struct CreateValidatorFailureMock: CreateValidatorImpl {
    
    func validate(_ person: iosTakeHomeProject.NewPerson) throws {
        throw CreateValidator.createValidatorError.invalidFirstName
    }
}
