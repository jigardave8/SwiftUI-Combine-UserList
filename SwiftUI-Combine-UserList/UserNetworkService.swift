//
//  UserNetworkService.swift
//  SwiftUI-Combine-UserList
//
//  Created by BitDegree on 27/10/24.
//

import Foundation
import Combine

class UserNetworkService {
    func fetchUsers() -> AnyPublisher<[UserModel], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
