//
//  MushroomMock.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension Mushroom {
    static let mockList: [Mushroom] = {
        guard
            let data = Data.fromJsonFile(filename: "mushrooms"),
            let response = try? JSONDecoder().fromSnakeCase().decode(MushroomsResponse.self, from: data)
        else {
            return []
        }

        return response.mushrooms
    }()
}
