//
//  UserDetailResponse.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 27/09/2025.
//

import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable, Equatable {
    let data: User
    let support: Support
}
