//
//  LoginAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension API {
    /// Fetch Podcasts by Search term
    static func login(_ request: LoginRequest) -> HttpEndpoint<LoginResponse> {
        return HttpEndpoint(
            method: .post,
            baseUrl: .default,
            path: "api/v1/users/login",
            parameters: request
        )
    }
}
