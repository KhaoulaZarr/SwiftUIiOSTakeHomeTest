//
//  NetworkingManagerCreateFailureMock.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 17/11/2025.
//

#if DEBUG
import Foundation

class NetworkingManagerCreateFailureMock: NetworkingManagerImpl {
    
    func request<T>(session: URLSession, _ endPoint: iosTakeHomeProject.EndPoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return Data() as! T
    }
    
    func request(session: URLSession, _ endpoint: iosTakeHomeProject.EndPoint) async throws {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
    
    
}

#endif
