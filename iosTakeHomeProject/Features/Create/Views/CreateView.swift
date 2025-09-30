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
    
    var body: some View {
        NavigationStack {
            Form {
                
                firstName
                lastName
                job
                
                
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
        CreateView()

}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
    
    var firstName: some View {
        TextField("First Name", text: $vm.person.firstName)
    }
    
    var lastName: some View {
        TextField("Last Name", text: $vm.person.lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
    }
    
    var submit: some View {
        Button("Submit") {
            vm.create()
        }
    }
}
