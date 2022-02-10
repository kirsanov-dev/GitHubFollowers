//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 10.02.2022.
//

import Foundation

enum ErrorMessage: String {
    case invalidRequest = "This username created an invalid request. Please try again."
    case unableToCompleteRequest = "Unable to complete your request. Please check the internet connection."
    case invalidResponse = "Invalid response from server. Please try again."
    case invalidData = "The data from server was invalid. Please try again."
}
