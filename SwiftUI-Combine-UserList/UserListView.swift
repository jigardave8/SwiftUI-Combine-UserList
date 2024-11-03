//
//  UserListView.swift
//  SwiftUI-Combine-UserList
//
//  Created by BitDegree on 27/10/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search users", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Sort Picker
                Picker("Sort by", selection: $viewModel.sortBy) {
                    Text("Name").tag(UserListViewModel.SortOption.name)
                    Text("Email").tag(UserListViewModel.SortOption.email)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                

                // Content
                if viewModel.isLoading {
                    ProgressView("Loading…")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    List(viewModel.filteredAndSortedUsers) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("User List")
            .onAppear {
                viewModel.loadUsers()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
