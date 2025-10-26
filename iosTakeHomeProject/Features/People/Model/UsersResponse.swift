//
//  UsersResponse.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 27/09/2025.
//


// MARK: - UsersResponse
struct UsersResponse: Codable, Equatable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

}
