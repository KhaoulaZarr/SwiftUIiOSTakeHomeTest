//
//  CreateValidator.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 01/10/2025.
//

import Foundation

protocol CreateValidatorImpl {
    func validate(_ person: NewPerson) throws
}

struct CreateValidator : CreateValidatorImpl {
    
    
    func validate(_ person: NewPerson) throws {
        if person.firstName.isEmpty {
            throw createValidatorError.invalidFirstName
        }
        
        if person.lastName.isEmpty {
            throw createValidatorError.invalidLastName
        }
        
        if person.job.isEmpty {
            throw createValidatorError.invalidJob
        }
    }
}

extension CreateValidator {
    
    enum createValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}

extension CreateValidator.createValidatorError {
    
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "First name can't be empty"
        case .invalidLastName:
            return "Last name can't be empty"
        case .invalidJob:
            return "Job can't be empty"
        }
    }
    
}
