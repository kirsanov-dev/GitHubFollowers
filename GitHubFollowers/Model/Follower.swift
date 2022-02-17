//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 10.02.2022.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarUrl: String
}
