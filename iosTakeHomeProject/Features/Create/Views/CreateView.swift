//
//  CreateView.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 28/09/2025.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = CreateViewModel()
    let successfulAction:() -> Void
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    firstName
                    lastName
                    job
                } footer: {
                    if case .validation(let err) = vm.error,
                       let errorDesc = err.errorDescription {
                        Text(errorDesc)
                            .foregroundStyle(.red)
                    }
                        
                }

                
                
                
                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
                    successfulAction()
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {}
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    CreateView {
        
    }

}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
    
    var firstName: some View {
        TextField("First Name", text: $vm.person.firstName)
            .focused($focusedField, equals: .firstName)
    }
    
    var lastName: some View {
        TextField("Last Name", text: $vm.person.lastName)
            .focused($focusedField, equals: .lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
            .focused($focusedField, equals: .job)
    }
    
    var submit: some View {
        Button("Submit") {
            focusedField = nil
            Task {
               await vm.create()
            }
            
        }
    }
}

extension CreateView {
    
    enum Field: Hashable {
        case firstName
        case lastName
        case job
    }
}
