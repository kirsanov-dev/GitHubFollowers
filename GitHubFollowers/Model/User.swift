//
//  User.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 10.02.2022.
//

import Foundation

struct User: Codable {
    let login: String
    let name: String?
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
