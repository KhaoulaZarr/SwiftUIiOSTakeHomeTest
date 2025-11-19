//
//  NetworkingManagerUserDetailsResponseFailureMock.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 17/11/2025.
//

#if DEBUG
import Foundation

class NetworkingManagerUserDetailsResponseFailureMock: NetworkingManagerImpl {
    
    func request<T>(session: URLSession, _ endPoint: iosTakeHomeProject.EndPoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
    
    func request(session: URLSession, _ endpoint: iosTakeHomeProject.EndPoint) async throws {}
    
}

#endif
