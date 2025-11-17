//
//  NetworkingManagerUserResponseSuccessMock.swift
//  iosTakeHomeProjectTests
//
//  Created by Khawla Zarrami on 26/10/2025.
//

import Foundation
@testable import iosTakeHomeProject

class NetworkingManagerUserResponseSuccessMock: NetworkingManagerImpl {
    
    func request<T>(session: URLSession, _ endPoint: iosTakeHomeProject.EndPoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: iosTakeHomeProject.EndPoint) async throws {}
    
}
