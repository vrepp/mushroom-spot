//
//  ProfileService.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation
import Combine

protocol ProfileServiceProtocol: AnyService {
    func fetch() async throws -> Profile
}

struct ProfileService: ProfileServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func fetch() async throws -> Profile {
        let endpoint = API.getProfile()

        let response = try await client.performRequest(endpoint: endpoint)
        return response.user
    }
}
