//
//  PeopleView.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 28/09/2025.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var shouldShowCreate = false
    @StateObject private var vm = PeopleViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                background
                if vm.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(vm.users, id: \.id) { user in
                                NavigationLink {
                                    DetailView(userId: user.id)
                                } label: {
                                    PersonItemView(user: user)
                                }

                                
                            }
                        }
                        .padding()
                    }
                }
                
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement:.primaryAction) {
                    create

                }
            }
            .onAppear {
                vm.fetchUsers()
              /*  do {
                    let res = try StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
                    users = res.data
                }catch {
                    print(error)
                }*/
                
            }
            .sheet(isPresented: $shouldShowCreate) {
                CreateView()
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    vm.fetchUsers()
                }
            }
            
        }
       
    }
}

#Preview {
    PeopleView()
}

private extension PeopleView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var create: some View {
        Button {
            shouldShowCreate.toggle()
        } label: {
            Symbols.plus
                .font(
                    .system(.headline, design: .rounded)
                    .bold()
                )
        }
        .disabled(vm.isLoading)

    }
        
}
