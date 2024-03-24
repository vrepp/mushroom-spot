//
//  MushroomAPI.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

extension API {
    /// Fetch Mushrooms
    static func getMushrooms() -> HttpEndpoint<MushroomsResponse> {
        return HttpEndpoint(
            method: .get,
            baseUrl: .default,
            path: "api/v1/mushrooms",
            parameters: nil
        )
    }
}
