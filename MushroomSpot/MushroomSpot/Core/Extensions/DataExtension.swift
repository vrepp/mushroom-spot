//
//  DataExtension.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension Data {
    static func fromJsonFile(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else { return nil }
            
        return try? Data(contentsOf: url)
    }
}
