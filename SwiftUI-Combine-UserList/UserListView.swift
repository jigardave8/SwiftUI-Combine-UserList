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
                if viewModel.isLoading {
                    ProgressView("Loading…")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    List(viewModel.users) { user in
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
