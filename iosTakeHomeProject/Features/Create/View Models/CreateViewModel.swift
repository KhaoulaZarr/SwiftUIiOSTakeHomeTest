//
//  CreateViewModel.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 29/09/2025.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published var person = NewPerson()
    @Published private(set) var state:  SubmissionState?
    @Published private(set) var error: FormError?
    @Published var hasError = false
    
    private let networkingManager: NetworkingManagerImpl!
    private let validator : CreateValidatorImpl!
    
    init(networkingManager: NetworkingManagerImpl = NetworkingManager.shared,
         validator: CreateValidatorImpl = CreateValidator()) {
        self.networkingManager = networkingManager
        self.validator = validator
    }
    
    @MainActor
    func create() async {
        
      /*  do {
            try validator.validate(person)
            
            state = .submitting
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let data = try? encoder.encode(person)
            NetworkingManager.shared.request(.create(submissionData: data)) {[weak self] res in
                DispatchQueue.main.async {
                    switch res {
                    case .success:
                        self?.state = .successful
                    case .failure(let err):
                        self?.state = .unsuccessful
                        self?.hasError = true
                        if let networkingError = err as? NetworkingManager.NetworkingError {
                            self?.error =  .networking(error: networkingError)
                        }
                        
                    }
                }
            }
            
        } catch {
            self.hasError = true
            if let validationError = error as? CreateValidator.createValidatorError {
                self.error = .validation(error: validationError)
            }
        }*/
        
        do {
            try validator.validate(person)
            state = .submitting
            
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let data = try encoder.encode(person)
            try await networkingManager.request(session: .shared, .create(submissionData: data))
            self.state = .successful
            
        } catch {
            self.hasError = true
            self.state = .unsuccessful
            switch error {
            case is NetworkingManager.NetworkingError:
                self.error = .networking(error: error as! NetworkingManager.NetworkingError)
            case is CreateValidator.createValidatorError:
                self.error = .validation(error: error as! CreateValidator.createValidatorError)
            default:
                self.error = .system(Error: error)
            }
        
        }
        
    }
}


extension CreateViewModel {
    
    enum SubmissionState {
        case unsuccessful
        case successful
        case submitting
    }
    
}


extension CreateViewModel {
    enum FormError: LocalizedError {
        case networking(error: LocalizedError)
        case validation(error: LocalizedError)
        case system(Error: Error)
    }
}

extension CreateViewModel.FormError {
    var errorDescription: String? {
        switch self {
        case .networking(let err),
                .validation(let err):
            return err.errorDescription
        case .system(let err):
            return err.localizedDescription
            
        }
    }
}

extension CreateViewModel.FormError: Equatable {
    static func == (lhs: CreateViewModel.FormError, rhs: CreateViewModel.FormError) -> Bool {
        switch(lhs, rhs){
        case (.networking(let lhsType), .networking(let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        case (.validation(let lhsType), .validation(let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        case (.system(let lhsType), .system(let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        default:
            return false
            
        }
    }
    
    
}
