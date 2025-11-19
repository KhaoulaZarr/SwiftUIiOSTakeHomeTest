//
//  CreateValidatorFailureMock.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 17/11/2025.
//
#if DEBUG
 import Foundation

struct CreateValidatorFailureMock: CreateValidatorImpl {
    
    func validate(_ person: iosTakeHomeProject.NewPerson) throws {
        throw CreateValidator.createValidatorError.invalidFirstName
    }
}

#endif
