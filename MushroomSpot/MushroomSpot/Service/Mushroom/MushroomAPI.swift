//
//  MushroomAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

extension API {
    /// Fetch Podcasts by Search term
    static func getMushrooms() -> HttpEndpoint<[Mushroom]> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "mushrooms",
            parameters: nil
        )
    }
}
