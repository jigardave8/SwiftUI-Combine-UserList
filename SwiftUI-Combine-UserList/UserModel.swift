//
//  UserModel.swift
//  SwiftUI-Combine-UserList
//
//  Created by BitDegree on 27/10/24.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
}
