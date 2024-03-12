//
//  API.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

protocol AnyService {
    var client: HttpClientProvider { get }

    init(client: HttpClientProvider)
}

enum API {}
