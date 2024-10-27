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

    private var cancellables = Set<AnyCancellable>()
    private let userService = UserNetworkService()

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
}
