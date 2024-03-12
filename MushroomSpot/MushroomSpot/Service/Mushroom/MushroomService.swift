//
//  MushroomService.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation
import Combine

protocol MushroomServiceProtocol: AnyService {
    func fetch() -> AnyPublisher<[Mushroom], Error>
}

struct MushroomService: MushroomServiceProtocol {
    let client: HttpClientProvider

    init(client: HttpClientProvider = HttpClient()) {
        self.client = client
    }

    func fetch() -> AnyPublisher<[Mushroom], Error> {
        let endpoint = API.getMushrooms()

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
