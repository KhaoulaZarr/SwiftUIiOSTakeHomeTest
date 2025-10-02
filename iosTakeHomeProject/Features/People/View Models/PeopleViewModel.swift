//
//  PeopleViewModel.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 29/09/2025.
//

import Foundation

final class PeopleViewModel : ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published private(set) var isLoading = false
    @Published var hasError = false
    
    
    @MainActor
    func fetchUsers() async {
        isLoading = true
        defer {isLoading = false}
        
      /*  isLoading = true
        NetworkingManager.shared.request(.people, type: UsersResponse.self) {[weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false }
                switch res {
                case .success(let response):
                    self?.users = response.data
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
            }
           
        }*/
        
        do {
            let response = try await NetworkingManager.shared.request(.people, type: UsersResponse.self)
            self.users = response.data
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
