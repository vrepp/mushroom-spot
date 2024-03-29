//
//  ProfileAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension API {
    /// Fetch Profile data
    static func getProfile() -> HttpEndpoint<ProfileResponse> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "users/me",
            parameters: nil
        )
    }
}
