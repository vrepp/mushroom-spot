//
//  ProfileAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension API {
    /// Fetch Podcasts by Search term
    static func getProfile() -> HttpEndpoint<Profile> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "users/me",
            parameters: nil
        )
    }
}
