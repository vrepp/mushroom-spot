//
//  ProfileService.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation
import Combine

protocol ProfileServiceProtocol: AnyService {
    func fetch() -> AnyPublisher<Profile, Error>
}

struct ProfileService: ProfileServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func fetch() -> AnyPublisher<Profile, Error> {
        let endpoint = API.getProfile()

        return Deferred {
            Future { promise in
                Task {
                    do {
                        let response = try await client.performRequest(endpoint: endpoint)
                        promise(.success(response))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
