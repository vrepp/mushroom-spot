//
//  LoginService.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation
import Combine

protocol LoginServiceProtocol: AnyService {
    func login(email: String, password: String) async throws -> String
}

struct LoginService: LoginServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func login(email: String, password: String) async throws -> String {
        let request = LoginRequest(email: email, password: password)
        let endpoint = API.login(request)

        let response = try await client.performRequest(endpoint: endpoint)
        return response.authToken
    }
}
