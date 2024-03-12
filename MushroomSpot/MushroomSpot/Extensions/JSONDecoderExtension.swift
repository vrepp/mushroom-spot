//
//  JSONDecoderExtension.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension JSONDecoder {
    func fromSnakeCase() -> Self {
        self.keyDecodingStrategy = .convertFromSnakeCase
        
        return self
    }
}
