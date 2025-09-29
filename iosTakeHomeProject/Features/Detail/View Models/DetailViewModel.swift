//
//  DetailViewModel.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 29/09/2025.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var userInfo: UserDetailResponse?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func fetchDetails(for id: Int) {
        NetworkingManager.shared.request("https://reqres.in/api/users/\(id)", type: UserDetailResponse.self) {[weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success(let response):
                    self?.userInfo = response
                case .failure(let error):
                    self?.error = error as? NetworkingManager.NetworkingError
                    self?.hasError = true
                }
            }
        }
    }
}
