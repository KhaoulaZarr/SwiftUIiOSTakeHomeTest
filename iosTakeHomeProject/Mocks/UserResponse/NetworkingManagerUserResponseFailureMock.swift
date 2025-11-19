//
//  NetworkingManagerUserResponseFailureMock.swift
//  iosTakeHomeProjectTests
//
//  Created by Khawla Zarrami on 26/10/2025.
//
#if DEBUG
import Foundation

class NetworkingManagerUserResponseFailureMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endPoint: iosTakeHomeProject.EndPoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
    
    func request(session: URLSession, _ endpoint: iosTakeHomeProject.EndPoint) async throws {}
}

#endif
