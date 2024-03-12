//
//  LoginAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension API {
    /// Fetch Podcasts by Search term
    static func login(_ request: LoginRequest) -> HttpEndpoint<Profile> {
        return HttpEndpoint(
            method: .post,
            baseUrl: .default,
            path: "users/me",
            parameters: request
        )
    }
}
