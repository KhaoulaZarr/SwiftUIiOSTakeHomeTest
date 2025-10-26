//
//  Models.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 27/09/2025.
//

// MARK: - User
struct User: Codable, Equatable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

}

// MARK: - Support
struct Support: Codable, Equatable {
    let url: String
    let text: String
}
