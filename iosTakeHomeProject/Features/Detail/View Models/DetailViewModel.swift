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
    @Published private(set) var isLoading = false
    @Published var hasError = false
    
    
    @MainActor
    func fetchDetails(for id: Int) async {
       /* isLoading = true
        NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self) {[weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false}
                switch res {
                case .success(let response):
                    self?.userInfo = response
                case .failure(let error):
                    self?.error = error as? NetworkingManager.NetworkingError
                    self?.hasError = true
                }
            }
        }*/
        isLoading = true
        defer { isLoading = false }
        do {
            self.userInfo = try await NetworkingManager.shared.request(.detail(id: id), type: UserDetailResponse.self)
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
        
    }
}
