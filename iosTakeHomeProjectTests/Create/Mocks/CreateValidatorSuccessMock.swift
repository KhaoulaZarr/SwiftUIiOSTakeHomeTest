//
//  CreateValidatorSuccessMock.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 17/11/2025.
//

import Foundation
@testable import iosTakeHomeProject

struct CreateValidatorSuccessMock: CreateValidatorImpl {
    func validate(_ person: iosTakeHomeProject.NewPerson) throws {}
        
}
