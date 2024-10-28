//
//  UserListViewModel.swift
//  SwiftUI-Combine-UserList
//
//  Created by BitDegree on 27/10/24.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    @Published var sortBy: SortOption = .name

    private var cancellables = Set<AnyCancellable>()
    private let userService = UserNetworkService()

    enum SortOption {
        case name, email
    }

    var filteredAndSortedUsers: [UserModel] {
        var filtered = users.filter {
            searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased())
        }
        switch sortBy {
        case .name:
            filtered.sort { $0.name < $1.name }
        case .email:
            filtered.sort { $0.email < $1.email }
        }
        return filtered
    }

    func loadUsers() {
        isLoading = true
        userService.fetchUsers()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
            .store(in: &cancellables)
    }

    func updateSortOption(to option: SortOption) {
        sortBy = option
    }
}
