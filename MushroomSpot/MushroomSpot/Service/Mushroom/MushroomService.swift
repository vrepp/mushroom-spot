//
//  MushroomService.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation
import Combine

protocol MushroomServiceProtocol: AnyService {
    func fetch() async throws -> [Mushroom]
}

struct MushroomService: MushroomServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func fetch() async throws -> [Mushroom] {
        let endpoint = API.getMushrooms()

        let response = try await client.performRequest(endpoint: endpoint)
        return response.mushrooms
    }
}
